output "bucket_name" {
  value = aws_s3_bucket.portfolio.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.portfolio.arn
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.portfolio.website_endpoint
}

output "github_deployer_user_arn" {
  value = aws_iam_user.github_deployer.arn
}

output "github_deployer_access_key_id" {
  value     = aws_iam_access_key.github_deployer.id
  sensitive = true
}

output "github_deployer_secret_access_key" {
  value     = aws_iam_access_key.github_deployer.secret
  sensitive = true
}
