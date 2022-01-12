variable "ami_id" {
  type        = string
  description = "ami_id"
}

variable "instance_type" {
  type        = string
  description = "instance_type"
}

variable "external_elb_name" {
  type        = string
  description = "external_elb_name"
}

variable "load_balancer_type" {
  type        = string
  description = "load_balancer_type"
}

variable "elb_target_group_name" {
  type        = string
  description = "elb_target_group_name"
}

variable "elb_port" {
  type        = string
  description = "elb_port"
}

variable "elb_protocol" {
  type        = string
  description = "elb_protocol"
}

variable "db_instance_name" {
  type        = string
  description = "db_instance_name"
}

variable "db_allocated_storage" {
  type        = string
  description = "db_allocated_storage"
}

variable "db_engine" {
  type        = string
  description = "db_engine"
}

variable "db_engine_version" {
  type        = string
  description = "db_engine_version"
}

variable "db_instance_class" {
  type        = string
  description = "db_instance_class"
}

variable "db_username" {
  type        = string
  description = "db_username"
}


variable "aws_db_subnet_group_name" {
  type        = string
  description = "aws_db_subnet_group_name"
}

variable "web_rt_cide_block" {
  type        = string
  description = "web_rt_cide_block"
}

variable "web_sg_name" {
  type        = string
  description = "web_sg_name"
}

variable "webserver_sg_name" {
  type        = string
  description = "webserver_sg_name"
}

variable "database_sg_name" {
  type        = string
  description = "database_sg_name"
}

variable "vpc_cidr_block" {
  type        = string
  description = "vpc_cidr_block"
}

variable "availability_zone_1" {
  type        = string
  description = "availability_zone_1"
}

variable "availability_zone_2" {
  type        = string
  description = "availability_zone_2"
}

variable "app_subnet_cidr_block_1" {
  type        = string
  description = "app_subnet_cidr_block_1"
}

variable "subnet_cidr_block_1" {
  type        = string
  description = "subnet_cidr_block_1"
}
variable "subnet_cidr_block_2" {
  type        = string
  description = "subnet_cidr_block_2"
}

variable "app_subnet_cidr_block_2" {
  type        = string
  description = "app_subnet_cidr_block_2"
}

variable "db_cidr_block_1" {
  type        = string
  description = "vpc_cidr_block"
}

variable "db_cidr_block_2" {
  type        = string
  description = "db_cidr_block_2"
}

