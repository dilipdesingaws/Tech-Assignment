resource "aws_lb" "external-elb" {
# for_each  = var.external-elb      - can be use to create a dynmaic resouces. 

  name               = var.external_elb_name    # lookup(external-elb.value, "external_elb_name", null)     
  internal           = false
  load_balancer_type = var.load_balancer_type  # lookup(external-elb.value, "load_balancer_type", null)     
  security_groups    = [aws_security_group.web-sg.id]
  subnets            = [aws_subnet.web-subnet-1.id, aws_subnet.web-subnet-2.id]
}

resource "aws_lb_target_group" "external-elb" {
# for_each  = var.external-elb-tg      - can be use to create a dynmaic resouces. 

  name     = var.elb_target_group_name     # lookup(external-elb-tg.value, "elb_target_group_name", null)     
  port     = var.elb_port   # lookup(external-elb-tg.value, "elb_port", null)     
  protocol = var.elb_protocol   # lookup(external-elb-tg.value, "elb_protocol", null)     
  vpc_id   = aws_vpc.my-vpc.id
}

resource "aws_lb_target_group_attachment" "external-elb1" {
# for_each  = var.lb-group-attachment     - can be use to create a dynmaic resouces. 

  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = aws_instance.webserver1.id
  port             = var.elb_port    # lookup(lb-group-attachment.value, "instance_type", null)     

  depends_on = [ aws_instance.webserver1 ]
}

resource "aws_lb_target_group_attachment" "external-elb2" {    # Can be created dynamically as above. 
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = aws_instance.webserver2.id
  port             = var.elb_port     

  depends_on = [ aws_instance.webserver2 ]
}

resource "aws_lb_listener" "external-elb" {
# for_each  = var.external-elb-listener      - can be use to create a dynmaic resouces. 

  load_balancer_arn = aws_lb.external-elb.arn
  port              = var.elb_port    # lookup(external-elb-listener.value, "elb_port", null)     
  protocol          = var.elb_protocol   # lookup(external-elb-listener.value, "elb_protocol", null)     

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-elb.arn
  }
}