module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  tags       = "vpc-tags"
}


module "networking" {
  source             = "./modules/networking"
  vpc_id             = module.vpc.vpc_id
  public_subnet_cidr = ["10.0.0.0/28", "10.0.0.16/28"]
  az                 = ["eu-west-2a", "eu-west-2b"]
  gateway_id         = module.vpc.internet_gateway_id

}




# # Create a VPC
# resource "aws_vpc" "my_vpc" {
#   cidr_block = "10.0.0.0/16"
#   enable_dns_support = true
#   enable_dns_hostnames = true

#   tags = {
#     Name = "MyVPC"
#   }
# }

# # Create two subnets in different Availability Zones
# resource "aws_subnet" "subnet_a" {
#   vpc_id                  = aws_vpc.my_vpc.id
#   cidr_block              = "10.0.1.0/24"
#   availability_zone       = "eu-west-2a"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "SubnetA"
#   }
# }

# resource "aws_subnet" "subnet_b" {
#   vpc_id                  = aws_vpc.my_vpc.id
#   cidr_block              = "10.0.2.0/24"
#   availability_zone       = "eu-west-2b"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "SubnetB"
#   }
# }

# # DB Subnets
# resource "aws_subnet" "dbsubnet_a" {
#   vpc_id                  = aws_vpc.my_vpc.id
#   cidr_block              = "10.0.3.0/24"
#   availability_zone       = "eu-west-2a"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "DBSubnetA"
#   }
# }

# resource "aws_subnet" "dbsubnet_b" {
#   vpc_id                  = aws_vpc.my_vpc.id
#   cidr_block              = "10.0.4.0/24"
#   availability_zone       = "eu-west-2b"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "DBSubnetB"
#   }
# }


# # data "aws_db_subnet_group" "database" {
# #   name = "my-test-database-subnet-group"
# # }

# resource "aws_db_subnet_group" "dbgroup" {
#   name       = "dbsubnetgroup"
#   subnet_ids = ["aws_subnet.dbsubnet_a.id", "aws_subnet.dbsubnet_b.id"]

#   tags = {
#     Name = "My DB subnet group"
#   }
# }

# # # Create a DB subnet group for RDS
# # resource "aws_db_subnet" "my_db_subnet_group" {
# #   name       = "MyDBSubnetGroup"
# #   subnet_ids = [aws_subnet.dbsubnet_a.id, aws_subnet.dbsubnet_b.id]
# # }


# # Create RDS instance
# resource "aws_db_instance" "my_rds_instance" {
#   identifier           = "my-rds-instance"
#   allocated_storage    = 100  # Adjust as needed
#   storage_type         = "gp2"
#   engine               = "mysql"
#   engine_version       = "5.7"  # MySQL compatible version
#   instance_class       = "db.t3.medium"  # Adjust as needed
#   username             = "admin"
#   password             = "Favour2024"  # Change this to a strong password
#   publicly_accessible  = false
#   multi_az             = true  # Enable Multi-AZ for high availability
#   db_subnet_group_name = aws_db_subnet_group.dbgroup.id

#   tags = {
#     Name = "MyRDSInstance"
#   }
# }