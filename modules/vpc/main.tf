resource "aws_vpc" "this" {
  cidr_block = var.cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = { Name = var.name }
}
resource "aws_subnet" "private" {
  for_each = toset(var.azs)
  vpc_id = aws_vpc.this.id
  cidr_block = cidrsubnet(var.cidr, 8, index(var.azs, each.value))
  availability_zone = each.value
  tags = { Name = "${var.name}-private-${each.value}" }
}
output "vpc_id" { value = aws_vpc.this.id }
