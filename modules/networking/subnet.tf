resource "aws_subnet" "public-subnets" {
  count                   = 2  
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.public_subnet_cidr, count.index)
  availability_zone       = element(var.az, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnets"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }

  tags = {
    Name = "example"
  }
}