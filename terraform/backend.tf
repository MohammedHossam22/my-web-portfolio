terraform {
  backend "s3" {
    bucket       = "muhammed-portfolio-s3"       # e.g. "web-portfolio"
    key          = "terraform/terraform.tfstate" # e.g. "terraform/terraform.tfstate"
    region       = "eu-north-1"
    encrypt      = true
    use_lockfile = true # native S3 state locking (Terraform >= 1.10, AWS provider >= 5.x)
  }
}
