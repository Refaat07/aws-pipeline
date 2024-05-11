
resource "aws_lb_target_group" "tGroup" {
  name     = "my-target-group"
  port     = 3000 
  protocol = "HTTP"
  vpc_id   = module.network_module.vpc_id

  health_check {
    path                = "/"
    port                = 3000
    protocol            = "HTTP"
    timeout             = 5
    interval            = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.common_resource_name}_Target_Group"
  }
}

resource "aws_lb" "loadBalancer" {
  name               = "my-alb"
  internal           = false 
  load_balancer_type = "application"

  subnets            = [
    module.network_module.subnets["publicSubnet1"].id,
    module.network_module.subnets["publicSubnet2"].id
  ] 
  tags = {
    Name = "${var.common_resource_name}_ALB"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.loadBalancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tGroup.arn
  }
}

resource "aws_lb_target_group_attachment" "tgAttachment" {
  target_group_arn = aws_lb_target_group.tGroup.arn
  target_id        = aws_instance.privateInstance.id
  port             = 3000
}
