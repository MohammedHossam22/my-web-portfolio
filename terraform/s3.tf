resource "aws_s3_bucket" "portfolio" {
  bucket = var.bucket_name

  tags = {
    Name      = var.bucket_name
    ManagedBy = "terraform"
    Project   = "web-portfolio"
  }
}

# Versioning matters here for two reasons: it protects the site content
# from accidental overwrite/delete, and it's what makes the S3 backend
# safe to use for the Terraform state stored under the state_prefix.
resource "aws_s3_bucket_versioning" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_website_configuration" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

# We're granting public access via a bucket POLICY (not ACLs), so ACLs stay
# blocked/ignored but the policy itself is allowed through.
resource "aws_s3_bucket_public_access_block" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false
  restrict_public_buckets = false
}

data "aws_iam_policy_document" "portfolio_bucket_policy" {
  # 1. Allow anonymous GetObject on every object in the bucket...
  statement {
    sid       = "PublicReadAllObjects"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.portfolio.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }

  # 2. ...then explicitly DENY it for anything under the state prefix.
  # In IAM policy evaluation an explicit Deny always wins over an Allow,
  # regardless of statement order, so the state file stays private even
  # though statement 1 above technically covers it too.
  statement {
    sid       = "DenyPublicReadOnState"
    effect    = "Deny"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.portfolio.arn}/${var.state_prefix}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_policy" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id
  policy = data.aws_iam_policy_document.portfolio_bucket_policy.json

  depends_on = [aws_s3_bucket_public_access_block.portfolio]
}
