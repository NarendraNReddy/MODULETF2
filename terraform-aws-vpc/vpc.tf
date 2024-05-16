resource "aws_vpc" "main" {
  #cidr_block       = "10.0.0.0/16"
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true 

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
        Name=local.resource_name
    }
  )
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.igw_tags,
    {
      Name=local.resource_name
    }
  )
}

# creat subnets (public,private,db)
# we decide every project insde joindevops.com have HA. 
# So we should force to create 2 subnets.






resource "aws_subnet" "public" {
  count=length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = true
  tags = merge(
    var.common_tags,
    var.public_subnet_cidr_tags,
    {
      
      Name="${local.resource_name}-public-${local.az_names[count.index]}"
    }
  )
}

#private subnet CIDRs ####


resource "aws_subnet" "private" {
  count=length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge(
    var.common_tags,
    var.private_subnet_cidr_tags,
    {
      
      Name="${local.resource_name}-private-${local.az_names[count.index]}"
    }
  )
}



#database subnet CIDRs ####

resource "aws_subnet" "database" {
  count=length(var.database_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge(
    var.common_tags,
    var.database_subnet_cidr_tags,
    {
      
      Name="${local.resource_name}-database-${local.az_names[count.index]}"
    }
  )
}