module "network" {
  source = "./modules/vpc"
  name = var.name
  cidr = var.vpc_cidr
  azs = var.azs
}

resource "aws_s3_bucket" "evidence" {
  bucket = "${var.name}-terraform-evidence"
}

resource "aws_s3_bucket_public_access_block" "evidence" {
  bucket = aws_s3_bucket.evidence.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "aws_cloudtrail" "main" {
  name = "${var.name}-trail"
  s3_bucket_name = aws_s3_bucket.evidence.id
  include_global_service_events = true
}
