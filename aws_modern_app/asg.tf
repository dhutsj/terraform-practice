resource "aws_launch_template" "example" {
  name_prefix   = "example"
  image_id      = data.aws_ami.example.id
  instance_type = "t2.micro"
  user_data     = filebase64("${path.module}/example.sh")
  key_name      = "tsj-deployer-key"
  network_interfaces {
    security_groups = [aws_security_group.allow_alb.id]
  }
}

resource "aws_autoscaling_group" "bar" {
  vpc_zone_identifier = [var.private_subnet1_id, var.private_subnet2_id]
  desired_capacity    = 2
  max_size            = 2
  min_size            = 2
  target_group_arns   = [aws_lb_target_group.test.arn]


  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }
}

resource "aws_security_group" "allow_alb" {
  name        = "allow_alb"
  description = "Allow alb only inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description     = "allow from alb"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_myself_only.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_alb"
  }
}
