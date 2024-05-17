#project 
variable "project_name" {
    type=string 
    # default = "" 
}

variable "environment" {
  type = string 
  default = "dev"
}

variable "common_tags" {
    type=map
    # default = {}
  
}


#VPC 
#cidr_block       = "10.0.0.0/16"
variable "vpc_cidr" {
    type = string 
    default = "10.0.0.0/16"
  
}
#enable_dns_hostnames = true 

variable "enable_dns_hostnames" {
    type = bool
    default = true
}

variable "vpc_tags" {
    type = map 
    default = {}  
}

#igw ttags

variable "igw_tags" {
    type = map 
    default = {}  
}

#public subnet


variable "public_subnet_cidr_tags" {
    type = map 
    default = {}
  
}


variable "public_subnet_cidrs" {
    type = list 
    validation {
      condition = length(var.public_subnet_cidrs) == 2
      error_message = "Please enter valid 2 public sunet cidrs"
    }
  
}

#private

variable "private_subnet_cidr_tags" {
    type = map 
    default = {}  
}


variable "private_subnet_cidrs" {
    type = list 
    validation {
      condition = length(var.private_subnet_cidrs) == 2
      error_message = "Please enter valid 2 public sunet cidrs"
    }
  
}

#database



variable "database_subnet_cidr_tags" {
    type = map 
    default = {}  
}


variable "database_subnet_cidrs" {
    type = list 
    validation {
      condition = length(var.database_subnet_cidrs) == 2
      error_message = "Please enter valid 2 public sunet cidrs"
    }
  
}

#NAT gateway tags:
variable "nat_gateway_tags" {
    type = map 
    default = {}
}

variable "public_route_table_tags" {
  type = map 
  default = {}
}

variable "private_route_table_tags" {
  type = map 
  default = {}
}

variable "database_route_table_tags" {
  type = map 
  default = {}
}





