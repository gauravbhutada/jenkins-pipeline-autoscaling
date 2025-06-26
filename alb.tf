resource "aws_lb" "my-alb" {

    name = "my-load-balancer"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.my-sg.id]
    subnets = [aws_subnet.sub1.id, aws_subnet.sub2.id]
}

#Target group
resource "aws_lb_target_group" "my-tg" {

    name = "my-target-group"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.main.id

    health_check {
      path = "/"
      interval = 20
      timeout = 5
      healthy_threshold = 3
      unhealthy_threshold = 2
    }
}

resource "aws_alb_listener" "http" {

    load_balancer_arn = aws_lb.my-alb.arn
    port = 80
    protocol = "HTTP"

    default_action {
      
      type = "forward"
      target_group_arn = aws_lb_target_group.my-tg.arn
    }

}