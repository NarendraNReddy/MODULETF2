variable "project_name" {
    default = "expense"
  
}

variable "common_tags" {
    default = {
        Project="expense"
        Environment="dev"
        Terraform="true"
        
    }
  
}

#2 public subnets:
variable "public_subnet_cidrs" {
    type = list 
    default = ["10.0.1.0/24","10.0.2.0/24"]  
}

#2 private subnets:
variable "private_subnet_cidrs" {
    type = list 
    default = ["10.0.11.0/24","10.0.12.0/24"]  
}

#2 database subnets:
variable "database_subnet_cidrs" {
    type = list 
    default = ["10.0.21.0/24","10.0.22.0/24"]  
}


#NAT 
#elastcic IP 

