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
  # Grant public GetObject on everything EXCEPT the state prefix, in one
  # statement, rather than allow-all + a Deny carve-out. A Deny with
  # Principal "*" would block literally everyone - including your own
  # IAM user and the deploy user - not just anonymous/public requests,
  # since bucket-policy Deny statements aren't limited to unauthenticated
  # callers. Using not_resources means the state prefix is simply never
  # granted to the public in the first place; authenticated principals
  # (you, the github-deployer user) still reach it via their own IAM
  # identity policies, which this bucket policy doesn't touch at all.
  statement {
    sid           = "PublicReadExceptState"
    effect        = "Allow"
    actions       = ["s3:GetObject"]
    not_resources = ["${aws_s3_bucket.portfolio.arn}/${var.state_prefix}/*"]

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
