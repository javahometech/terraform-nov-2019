module "networking" {
    source       = "./modules/networking"
}
module "elb" {
  source       = "./modules/elb"
  instance_ids = module.networking.ec2_ids
  subnets      = module.networking.pub_sub_ids
  vpc_id       = module.networking.vpc_id
  app_name     = "myapp"
  elb_rules = [
    {
      from_port : 80,
      to_port : 80,
      protocol : "tcp",
      cidr_blocks : "0.0.0.0/0"
    },
    {
      from_port : 8080,
      to_port : 8080,
      protocol : "tcp",
      cidr_blocks : "0.0.0.0/0"
    },
    {
      from_port : 22,
      to_port : 22,
      protocol : "tcp",
      cidr_blocks : "13.123.8.90/32"
    },
    {
      from_port : 22,
      to_port : 22,
      protocol : "tcp",
      cidr_blocks : "13.123.18.90/32"
    }
  ]

}

module "route53" {
  source       = "./modules/route53"
  elb_dns_name = module.elb.elb_dns_name
  elb_zone_id  = module.elb.elb_zone_id
  zone_name    = "javahome.in"
}

