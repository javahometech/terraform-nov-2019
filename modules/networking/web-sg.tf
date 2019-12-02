resource "aws_security_group" "web_ec2" {
  name        = "javahomeapp-sg-${terraform.workspace}"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myapp.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["106.51.110.62/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}