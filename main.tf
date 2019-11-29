module "elb"{
    source = "./modules/elb"
    instance_ids = aws_instance.web.*.id
    subnets =  local.pub_sub_ids
    vpc_id = aws_vpc.myapp.id
}

