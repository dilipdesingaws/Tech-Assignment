# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "Demo IGW"
  }
}

# Create Web layber route table
resource "aws_route_table" "web-rt" {
  vpc_id = aws_vpc.my-vpc.id

# dynamic "route" {
#     for_each = var.vpc_routes
#     content {
  route {        # this can be created Dynamically.
    cidr_block = var.web_rt_cide_block
    gateway_id = aws_internet_gateway.igw.id
  }
# }
  tags = {
    Name = "WebRT"
  }
}

# Create Web Subnet association with Web route table
resource "aws_route_table_association" "a" {
# for_each  = var.route_table_association      - can be use to create a dynmaic resouces. 
  subnet_id      = aws_subnet.web-subnet-1.id
  route_table_id = aws_route_table.web-rt.id
}

resource "aws_route_table_association" "b" {       # can be deleted if this can be created Dynamically by above resouce. 
  subnet_id      = aws_subnet.web-subnet-2.id
  route_table_id = aws_route_table.web-rt.id
}
 