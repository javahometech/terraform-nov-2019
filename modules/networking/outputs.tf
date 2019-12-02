output "vpc_id"{
    value = aws_vpc.myapp.id
}

output "pub_sub_ids"{
    value = local.pub_sub_ids
}
output "ec2_ids"{
    value = aws_instance.web.*.id
}