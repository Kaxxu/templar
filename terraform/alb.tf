resource "aws_lb" "main" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.main.id]
  subnets         = [aws_subnet.main.id]

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "main" {
  name        = "${var.name}-alb"
  target_type = "instance"
  #    target_type = "ip"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    enabled             = true
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    interval            = 90
    timeout             = 20
    matcher             = "200"
  }
}

resource "aws_lb_listener" "front" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_lb_target_group_attachment" "main" {
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = aws_instance.main.id
  port             = 80

  depends_on = [
    aws_instance.main
  ]
}
