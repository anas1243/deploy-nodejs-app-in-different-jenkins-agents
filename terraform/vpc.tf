# Create a VPC
resource "aws_vpc" "iti_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.env}_iti_vpc"
  }
}