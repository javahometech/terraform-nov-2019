variable "region" {
    description = "Choose the region"
    default = "ap-south-1"
    type = string
}

variable "vpc_cidr" {
    description = "Choose cidr of vpc"
    default = "10.0.0.0/16"
    type = string
}

variable "private_cidrs" {
    description = "Choose cidrs for private subnets"
    default = ["10.0.1.0/24","10.0.2.0/24"]
    type = list
}