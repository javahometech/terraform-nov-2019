provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "in.javahome.930am-oct.tf"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "javahome-db"
  }
}
