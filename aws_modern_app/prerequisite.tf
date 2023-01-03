module "vpc_etc" {
  source = "../aws_vpc_network/"

  eip_allocation_id = "eipalloc-07376f7bda8a4c2ad"
}
