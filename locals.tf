locals {
  pri_sub_names = data.aws_availability_zones.azs.names
  public_netnum = length(local.pri_sub_names)
  pub_sub_ids = aws_subnet.public.*.id
  pri_sub_ids = aws_subnet.private.*.id
}