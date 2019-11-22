resource "aws_vpc" "myapp-2" {

  cidr_block       = "10.20.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name  = "manual-vpc"
    Batch = "930 AM AWS"
  }

}