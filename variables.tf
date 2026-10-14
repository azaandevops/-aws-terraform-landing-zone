variable "aws_region" { type = string, default = "us-east-2" }
variable "name" { type = string, default = "devops-landing-zone" }
variable "vpc_cidr" { type = string, default = "10.40.0.0/16" }
variable "azs" { type = list(string), default = ["us-east-2a","us-east-2b"] }
