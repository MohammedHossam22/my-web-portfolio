resource "github_actions_secret" "aws_access_key_id" {
  repository      = var.github_repo
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = aws_iam_access_key.github_deployer.id
}

resource "github_actions_secret" "aws_secret_access_key" {
  repository      = var.github_repo
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = aws_iam_access_key.github_deployer.secret
}

resource "github_actions_secret" "aws_region" {
  repository      = var.github_repo
  secret_name     = "AWS_REGION"
  plaintext_value = var.aws_region
}

resource "github_actions_secret" "s3_bucket_name" {
  repository      = var.github_repo
  secret_name     = "S3_BUCKET_NAME"
  plaintext_value = aws_s3_bucket.portfolio.bucket
}

# The Terraform Apply workflow needs a GitHub token itself, at runtime, to
# satisfy the `github` provider (github_secrets.tf's own resources need it
# to authenticate). Storing the same token you pass in with -var here closes
# that loop so CI can re-run this exact config without you doing anything
# by hand after the first bootstrap apply.
resource "github_actions_secret" "tf_github_token" {
  repository      = var.github_repo
  secret_name     = "TF_GITHUB_TOKEN"
  plaintext_value = var.github_token
}

resource "github_actions_secret" "amplify_app_id" {
  repository      = var.github_repo
  secret_name     = "AMPLIFY_APP_ID"
  plaintext_value = var.amplify_app_id
}

resource "github_actions_secret" "amplify_branch_name" {
  repository      = var.github_repo
  secret_name     = "AMPLIFY_BRANCH_NAME"
  plaintext_value = var.amplify_branch_name
}

resource "github_actions_secret" "site_prefix" {
  repository      = var.github_repo
  secret_name     = "SITE_PREFIX"
  plaintext_value = var.site_prefix
}
