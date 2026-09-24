variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "eu-north-1"
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name for the portfolio site"
  type        = string
  default     = "muhammed-portfolio-s3"
}

variable "state_prefix" {
  description = "Key prefix inside the bucket reserved for the Terraform state file. Everything under this prefix is denied public read access."
  type        = string
  default     = "terraform"
}

variable "github_user_name" {
  description = "Name of the IAM user used by the GitHub Actions workflow update on the infrastructure using terraform"
  type        = string
  default     = "web-portfolio-terraform-github"
}

variable "github_owner" {
  description = "GitHub org or username that owns the target repository"
  type        = string
  default     = "MohammedHossam22"
}

variable "github_repo" {
  description = "GitHub repository name (without owner) to push Actions secrets into"
  type        = string
  default     = "my-web-portfolio"
}

variable "github_token" {
  description = "GitHub Personal Access Token used ONLY at apply-time to create/update Actions secrets and will be used in further deployment by the workflow to add or update the secrets"
  type        = string
  sensitive   = true
}

variable "index_document" {
  description = "Static website index document"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Static website error document"
  type        = string
  default     = "error.html"
}
variable "amplify_app_id" {
  description = "ID of the Amplify app you already created in the console (e.g. \"d1a2b3c4d5e6f7\"). This app is NOT managed by Terraform - only referenced, so nothing here can touch its console-configured settings."
  type        = string
  default     = "{d1rgh0f841jc2s}"
}

variable "amplify_branch_name" {
  description = "Amplify branch to deploy to - must already exist on the app in the console"
  type        = string
  default     = "staging"
}

variable "site_prefix" {
  description = "Key prefix inside the bucket where built site artifacts live, kept separate from both the bucket root and state_prefix so Amplify's BUCKET_PREFIX pull can never accidentally reach terraform/"
  type        = string
  default     = "amplify"
}
