# AWS 3 tier Terraform module

Terraform module which creates VPC resources on AWS.

## Usage

```hcl
module "kpmg" {
  source                   = "./3-tier-module"
  ami_id                   = "ami-0d5eff06f840b45e9"
  instance_type            = "t2.micro"
  availability_zone_1      = "us-east-1a"
  availability_zone_2      = "us-east-1b"
  external_elb_name        = "External-LB-1"
  load_balancer_type       = "application"
  elb_target_group_name    = "ALB-TG-1"
  elb_port                 = "80"
  elb_protocol             = "HTTP"
  db_instance_name         = "webapp_db_1"
  db_allocated_storage     = "10"
  db_engine                = "mysql"
  db_engine_version        = "8.0.20"
  db_instance_class        = "db.t2.micro"
  db_username              = "username"
  aws_db_subnet_group_name = "webapp_db_subnet_group"
  web_rt_cide_block        = "0.0.0.0/0"
  web_sg_name              = "web_sg_name_1"
  webserver_sg_name        = "Webserver-SG-1"
  database_sg_name         = "Database-SG-1"
  vpc_cidr_block           = "10.0.0.0/16"
  subnet_cidr_block_1      = "10.0.1.0/24"
  subnet_cidr_block_2      = "10.0.2.0/24"
  app_subnet_cidr_block_1  = "10.0.11.0/24"
  app_subnet_cidr_block_2  = "10.0.12.0/24"
  db_cidr_block_1          = "10.0.21.0/24"
  db_cidr_block_2          = "10.0.22.0/24"
}
}
```

Note: 

* Access key and secret keys are need to be added with the following command before deploying the module. 

``` hcl 

a0806879@AINLA2F815QML87  # aws configure                      
AWS Access Key ID [****************ZXWH]: 
AWS Secret Access Key [****************4RP7]: 
Default region name [None]:
Default output format [None]: text

```

## Terraform provider section. 

 * The required terraform version will be  greater than or equal to 1.1.3.
 * The required terraform provider will be greater than or equal to 3.71.0.

```hcl 
terraform {
  required_version = ">= 1.1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.71.0"
    }
  }
}

```

* The deployment will be done on the us-east-1 region by default. Change the following parameters to change the region to be installed. 
```hcl 
provider "aws" {
  region = "us-east-1"
}
```

## Terraform plan and apply.
 
 * terraform validate - Command will be used to validate the configuration. 
 * terraform plan    - Command will be used to run the plan the  configuration files.
 * terraform apply    -  Command will be used to run the apply the  configuration files.

## variables.tf input variables.

* Most of the input variables that are used in the module are specified in the variables.tf file. 

## Data section of the module.

* Data section is used get the password field from the secret manager.

```hcl 
data "aws_secretsmanager_secret" "by-arn" {
  arn = "arn:aws:secretsmanager:us-east-1:415692045603:secret:webapp_db_password-8gw0Ec"
}

data "aws_secretsmanager_secret_version" "db-secret" {
  secret_id = "${data.aws_secretsmanager_secret.by-arn.id}"
}

```

## Adding Dynamics to the resources 

```hcl
 
resource "aws_instance" "webserver1" {
 for_each  = var.aws_instances
  instance_type          = lookup(aws_instances.value, "instance_type", null)     
  availability_zone      =  lookup(aws_instances.value, "availability_zone_1", null)     
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = aws_subnet.web-subnet-1.id
  ami                    = lookup(aws_instances.value, "ami_id", null)               
  user_data              = file("${path.module}/install_apache.sh")
}

```

## locals.tf dynamic provisioning 

* locals.tf file has an example code that can be used to create the resource adynamically.
* This module doesn't support the dynamic provisioning yet. But this can be implemented later on.

Example for the Dynamic provisioning.. 

```hcl 
  aws_instance_list = {
    dev = [
      {
        ami_id            = "ami-0d5eff06f840b45e9"
        instance_type     = "t2.micro"
        availability_zone = "us-east-1a"
      }
      {
        ami_id : "ami-0d5eff06f840b45e9",
        instance_type : "t2.micro"
        availability_zone_1 : "us-east-1b"
      }
    ]
   staging = []
   prod    = []
  }

```

# How to acccess the webpage

* In order to access the website, copy and paste the ELB dns url to the browser. You will get the response from the web-server on round robin basic. 

```hcl 
    "External-LB-1-470801705.us-east-1.elb.amazonaws.com"
```
