# --- Bootstrap order matters ---
# The bucket that will hold this state doesn't exist yet on your very first
# `terraform apply`, so you cannot point the backend at it from minute one.
#
# 1) First apply with NO backend block (local state):
#       terraform init
#       terraform apply -var="github_token=$TF_VAR_github_token"
#
# 2) Once the bucket exists, rename this file to backend.tf, fill in the
#    placeholders below (must match var.bucket_name / var.state_prefix /
#    var.aws_region from variables.tf), then migrate state into S3:
#       terraform init -migrate-state
#
# NOTE: partial/native backend config blocks cannot reference variables,
# so these values must be filled in literally.

terraform {
  backend "s3" {
    bucket       = "{BUCKET_NAME}"                    # e.g. "web-portfolio"
    key          = "{STATE_PREFIX}/terraform.tfstate" # e.g. "terraform/terraform.tfstate"
    region       = "{AWS_REGION}"                     # e.g. "us-east-1"
    encrypt      = true
    use_lockfile = true # native S3 state locking (Terraform >= 1.10, AWS provider >= 5.x)
  }
}
