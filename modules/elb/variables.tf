variable "app_name"{
    default = "javahome"
}

variable "subnets"{
    type = list
    description = "Subnets for elb"
}

variable "listner"{
    type = map
    default = {
         instance_port     = 80
         instance_protocol = "http"
         lb_port           = 80
         lb_protocol       = "http"
    }
}

variable "instance_ids"{
    type = list
    description = "instance_ids for elb"
}