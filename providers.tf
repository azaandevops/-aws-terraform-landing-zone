provider "aws" {
  region = var.aws_region
  default_tags { tags = { ManagedBy = "Terraform", Portfolio = "aws-landing-zone" } }
}
