output "elb_dns_name"{
    value = aws_elb.bar.dns_name
}

output "elb_zone_id"{
    value = aws_elb.bar.zone_id
}