resource "aws_lb" "alb" {
  name               = "tsj-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_myself_only.id]
  subnets            = [var.public_subnet1_id, var.public_subnet2_id]

  enable_deletion_protection = false

  tags = {
    Environment = "dev"
  }
}

resource "aws_security_group" "allow_myself_only" {
  name        = "allow_myself_only"
  description = "Allow myself only inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "80 from myself"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["114.82.149.107/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_80"
  }
}

resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    healthy_threshold   = 3
    interval            = 10
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}
