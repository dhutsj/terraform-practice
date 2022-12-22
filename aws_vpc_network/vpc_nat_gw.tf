resource "aws_nat_gateway" "natgw" {
  allocation_id = var.eip_allocation_id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = " my_gw_NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}
