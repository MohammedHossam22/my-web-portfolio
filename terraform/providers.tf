terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  # Credentials are picked up from your local environment
  # (AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY / AWS_PROFILE / SSO, etc).
  # Never hardcode AWS credentials in this file.
}

provider "github" {
  owner = var.github_owner
  token = var.github_token
  # github_token must be a Personal Access Token (classic: "repo" scope,
  # or fine-grained: "Secrets" write permission) for var.github_owner/var.github_repo.
  # Pass it as TF_VAR_github_token or -var, never commit it.
}
