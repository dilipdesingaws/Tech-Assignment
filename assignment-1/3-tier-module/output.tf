output "aws_instance_1" {
  description = "id of aws_instance_1"
  value       = aws_instance.webserver1.id
}

output "aws_instance_2" {
  description = "id of aws_instance_2"
  value       = aws_instance.webserver2.id
}

output "aws_elb" {
  description = "id of aws_lb"
  value       = aws_lb.external-elb.id
}
 
output "aws_elb_dns_name" {
  description = "id of aws_lb dns name"
  value       = aws_lb.external-elb.dns_name
}

output "aws_db_instance" {
  description = "id of aws_lb"
  value       = aws_db_instance.default.id
}
