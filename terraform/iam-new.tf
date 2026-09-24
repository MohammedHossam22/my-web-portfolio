data "aws_caller_identity" "current" {}

locals {
  github_deployer_policy_name = "${var.github_user_name}-s3-policy"
  github_deployer_policy_arn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${local.github_deployer_policy_name}"
  amplify_app_arn             = "arn:aws:amplify:${var.aws_region}:${data.aws_caller_identity.current.account_id}:apps/${var.amplify_app_id}"
}

data "aws_iam_policy_document" "github_user_policy" {
  statement {
    sid    = "FullS3AccessThisBucketOnly"
    effect = "Allow"
    actions = [
      "s3:*",
    ]
    resources = [
      aws_s3_bucket.portfolio.arn,
      "${aws_s3_bucket.portfolio.arn}/*",
    ]
  }

  statement {
    sid    = "AmplifyDeployThisAppOnly"
    effect = "Allow"
    actions = [
      "amplify:GetApp",
      "amplify:GetBranch",
      "amplify:CreateDeployment",
      "amplify:StartDeployment",
      "amplify:GetJob",
      "amplify:ListJobs",
    ]
    resources = [
      local.amplify_app_arn,
      "${local.amplify_app_arn}/*",
    ]
  }

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
