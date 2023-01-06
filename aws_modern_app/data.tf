data "aws_ami" "example" {
  most_recent = true
  name_regex  = "tio_base_centos7*"
  owners      = ["702267635140"]
}
