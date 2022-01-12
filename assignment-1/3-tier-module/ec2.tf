resource "aws_instance" "webserver1" {
# for_each  = var.aws_instances      - can be use to create a dynmaic resouces. 
  instance_type          = var.instance_type   # lookup(aws_instances.value, "instance_type", null)     
  availability_zone      = var.availability_zone_1  # lookup(aws_instances.value, "availability_zone_1", null)     
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = aws_subnet.web-subnet-1.id
  ami                    = var.ami_id     # lookup(aws_instances.value, "ami_id", null)               
  user_data              = file("${path.module}/install_apache.sh")

  tags = {
    Name = "Web Server-1"
  }
}

resource "aws_instance" "webserver2" {   # Can be created dynamically as above by for_each loop. 
  ami                    = var.ami_id
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone_2
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = aws_subnet.web-subnet-2.id
  user_data              = file("${path.module}/install_apache.sh")

  tags = {
    Name = "Web Server-2"
  }
}

