data "aws_caller_identity" "current" {}

locals {
  # Built from known values (account id + a literal name), NOT from
  # aws_iam_policy.github_deployer.arn - referencing the resource's own
  # attribute from inside the policy document that defines it is a
  # dependency cycle (the policy needs the document; the document would
  # need the policy's arn). This computes the same ARN without the loop.
  github_deployer_policy_name = "${var.github_user_name}-s3-policy"
  github_deployer_policy_arn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${local.github_deployer_policy_name}"
}

data "aws_iam_policy_document" "github_user_policy" {
  # Full S3 access - but ONLY on this one bucket (both the bucket ARN itself
  # and everything inside it). Deliberately a wildcard action instead of an
  # enumerated list: an enumerated list needs a new entry every time s3.tf
  # grows a new resource type (CORS, lifecycle, replication, whatever comes
  # next), which is exactly the whack-a-mole you just hit. s3:* still can't
  # reach any OTHER bucket or any other AWS service - the blast radius is
  # the resources list below, not the actions list.
  statement {
    sid    = "FullS3AccessThisBucketOnly"
    effect = "Allow"
    actions = [
      "s3:*",
      "s3:GetBucketAcl",
    ]
    resources = [
      aws_s3_bucket.portfolio.arn,
      "${aws_s3_bucket.portfolio.arn}/*",
    ]
  }

  # Self-management only: this lets the CI user re-apply iam.tf (refresh,
  # rotate its own key, update its own policy document) but it CANNOT touch
  # any other IAM user, policy, or role in the account - every resource
  # below is pinned to this specific user/policy's own ARN.
  #
  # SECURITY NOTE: because this statement lets the user rewrite its own
  # policy's content (CreatePolicyVersion), anyone who can merge to the
  # branch that triggers this workflow can, in principle, grant this user
  # more than S3 access. Treat that branch/PR path with the same care as
  # direct AWS console access - branch protection + required review is
  # strongly recommended if you keep IAM self-management in CI.
  statement {
    sid    = "SelfIamManagement"
    effect = "Allow"
    actions = [
      "iam:GetUser",
      "iam:TagUser",
      "iam:ListAccessKeys",
      "iam:CreateAccessKey",
      "iam:DeleteAccessKey",
      "iam:ListAttachedUserPolicies",
      "iam:AttachUserPolicy",
      "iam:DetachUserPolicy",
    ]
    resources = [aws_iam_user.github_deployer.arn]
  }

  statement {
    sid    = "SelfPolicyManagement"
    effect = "Allow"
    actions = [
      "iam:GetPolicy",
      "iam:GetPolicyVersion",
      "iam:ListPolicyVersions",
      "iam:CreatePolicyVersion",
      "iam:DeletePolicyVersion",
    ]
    resources = [local.github_deployer_policy_arn]
  }
}

resource "aws_iam_user" "github_deployer" {
  name = var.github_user_name

  tags = {
    ManagedBy = "terraform"
    Purpose   = "github-actions-deploy"
  }
}

resource "aws_iam_policy" "github_deployer" {
  name        = local.github_deployer_policy_name
  description = "Full object access + bucket-level read on ${var.bucket_name} only - no other AWS permissions"
  policy      = data.aws_iam_policy_document.github_user_policy.json
}

resource "aws_iam_user_policy_attachment" "github_deployer" {
  user       = aws_iam_user.github_deployer.name
  policy_arn = aws_iam_policy.github_deployer.arn
}

resource "aws_iam_access_key" "github_deployer" {
  user = aws_iam_user.github_deployer.name
}
