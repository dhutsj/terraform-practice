# AWS Internet Gateway has no EIP(no internet access itself), but it is needed for EC2 instances with EIP
# in public subnet to access to internet.
# Run curl ifconfig.me inside the EC2 instance, you can see the EIP bind to it.

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "myig"
  }
}
