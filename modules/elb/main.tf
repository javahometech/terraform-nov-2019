# Create a new load balancer
resource "aws_elb" "bar" {
  name               = local.name
  subnets            = var.subnets


  listener {
    instance_port     = var.listner.instance_port
    instance_protocol = var.listner.instance_protocol
    lb_port           = var.listner.lb_port
    lb_protocol       = var.listner.lb_protocol
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = var.instance_ids
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = local.name
  }
}