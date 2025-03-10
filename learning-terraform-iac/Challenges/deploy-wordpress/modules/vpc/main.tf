# CREATE A VPC AND SECURITY GROUPS

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "WordPressVPC"
  }
}

resource "aws_subnet" "public" {
  cidr_block              = "10.0.1.0/24"
  # availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
   vpc_id     = aws_vpc.main.id
  tags = {
    Name = "PublicSubnet"
  }
}

