resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "Demo VPC"
  }
}

# Create Web Public Subnet
resource "aws_subnet" "web-subnet-1" {
# for_each  = var.all_aws_subnet      - can be use to create a dynmaic resouces. 

  vpc_id                  = aws_vpc.my-vpc.id      # lookup(all_aws_subnet.value, "vpc_id", null)     
  cidr_block              = var.subnet_cidr_block_1 # lookup(all_aws_subnet.value, "subnet_cidr_block_1", null) 
  availability_zone       = var.availability_zone_1  # lookup(all_aws_subnet.value, "availability_zone_1", null) 
  map_public_ip_on_launch = true

  tags = {
    Name = "Web-1a"
  }
}

resource "aws_subnet" "web-subnet-2" {    # Can be created dynamically as above by for_each loop. 
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.subnet_cidr_block_2
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name = "Web-2b"
  }
}

# Create Application Private Subnet
resource "aws_subnet" "application-subnet-1" {  # Can be created dynamically as above by for_each loop. 
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.app_subnet_cidr_block_1
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = false

  tags = {
    Name = "Application-1a"
  }
}

resource "aws_subnet" "application-subnet-2" {   # Can be created dynamically as above by for_each loop. 
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.app_subnet_cidr_block_2
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = false

  tags = {
    Name = "Application-2b"
  }
}

# Create Database Private Subnet
resource "aws_subnet" "database-subnet-1" {   # Can be created dynamically as above by for_each loop.  
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.db_cidr_block_1 
  availability_zone = var.availability_zone_1 

  tags = {
    Name = "Database-1a"
  }
}

resource "aws_subnet" "database-subnet-2" {    # Can be created dynamically as above by for_each loop. 
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.db_cidr_block_2
  availability_zone = var.availability_zone_2

  tags = {
    Name = "Database-2b"
  }
}

