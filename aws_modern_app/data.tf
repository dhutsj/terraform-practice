data "aws_ami" "example" {
  most_recent = true
  name_regex  = "tsj_nginx*"
}
