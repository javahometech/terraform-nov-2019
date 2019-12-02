# Create a new load balancer
resource "aws_elb" "bar" {
  name               = "${local.name}-elb"
  subnets            = var.subnets
  security_groups    = ["${aws_security_group.elb.id}"]

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
    Name = "${local.name}-elb"
  }
}

resource "aws_security_group" "elb" {
  name        = "${local.name}-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

// create ingress rules for load balancer
resource "aws_security_group_rule" "elb_rule" {
  count           = length(var.elb_rules)
  type            = "ingress"
  from_port       = var.elb_rules[count.index]["from_port"]
  to_port         = var.elb_rules[count.index]["to_port"]
  protocol        = var.elb_rules[count.index]["protocol"]
  cidr_blocks     = [var.elb_rules[count.index]["cidr_blocks"]]
  security_group_id = aws_security_group.elb.id
}

variable "elb_rules"{
  type = list(map(string))
}
