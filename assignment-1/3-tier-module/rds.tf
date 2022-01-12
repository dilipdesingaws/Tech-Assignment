resource "aws_db_instance" "default" {
  name                   = var.db_instance_name
  allocated_storage      = var.db_allocated_storage
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  multi_az               = true
  username               = var.db_username
  password               = data.aws_secretsmanager_secret_version.db-secret.secret_string
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}

resource "aws_db_subnet_group" "default" {
# for_each  = var.aws_db_subnet_group      - can be use to create a dynmaic resouces. 

  name       = var.aws_db_subnet_group_name      # lookup(aws_db_subnet_group.value, "aws_db_subnet_group_name", null) 
  subnet_ids = [aws_subnet.database-subnet-1.id, aws_subnet.database-subnet-2.id]

  tags = {
    Name = "My DB subnet group"
  }
}