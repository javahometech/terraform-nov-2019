variable "region" {
  description = "Choose the region"
  default     = "ap-south-1"
  type        = string
}

variable "vpc_cidr" {
  description = "Choose cidr of vpc"
  default     = "10.0.0.0/16"
  type        = string
}

variable web_amis {
  default = {
    ap-south-1 = "ami-0ce933e2ae91880d3"
    us-east-2  = "ami-0dacb0c129b49f529"
  }
}

variable ec2_bucket {
  description = "The bucket for ec2 web servers"
  default     = "javahome-5678"
}

variable "service_name" {
  default = "ec2"
}