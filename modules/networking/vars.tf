variable "vpc_id" {
    default = ""
    type = string 
    description = "vpc id to create subnet in"
}

variable "public_subnet_cidr" {
    default = []
    description = "Public subnet cidr blocks"
    type = list(string)
}

variable "az" {
    default = []
    description = "Availability zone"
    type = list(string)
}

variable "gateway_id" {
    default = ""
    description = "internet gateway id"
    type = string
  
}