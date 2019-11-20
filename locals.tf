locals {
  pri_sub_names = data.aws_availability_zones.azs.names
  public_netnum = length(local.pri_sub_names)
}