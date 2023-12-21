resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.tags
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "${var.tags}-igw"
  }
}


output "vpc_id" {
    value = aws_vpc.my_vpc.id
  
}

output "internet_gateway_id" {
    value = aws_internet_gateway.gw.id
}