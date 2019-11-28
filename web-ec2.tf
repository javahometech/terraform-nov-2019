resource "aws_instance" "web" {
  count                       = 2
  ami                         = lookup(var.web_amis, var.region)
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = local.pub_sub_ids[count.index]
  user_data                   = file("scripts/apache.sh")
  iam_instance_profile        = aws_iam_instance_profile.ec2_iam_profile.name
  vpc_security_group_ids      = [aws_security_group.web_ec2.id]
  tags = {
    Name        = "web-${count.index + 1}"
    Environment = terraform.workspace
  }
}
