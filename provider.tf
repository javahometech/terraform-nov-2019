provider "aws"{
    region = var.region
}

// Create VPC using terraform

resource "aws_vpc" "myapp"{

    cidr_block       = "10.0.0.0/16"
    instance_tenancy = "default"
    
    tags = {
      Name = "JavaHomeVPC"
      Batch = "930AM"
      Year = 2019
    }

}
resource "aws_subnet" "private" {
  count = 2
  vpc_id     = aws_vpc.myapp.id
  cidr_block = var.private_cidrs[count.index]

  tags = {
    Name = "PrivateSubnet"
  }
}