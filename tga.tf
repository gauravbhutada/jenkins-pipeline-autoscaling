resource "aws_lb_target_group_attachment" "server1" {

    target_group_arn = aws_lb_target_group.my-tg.arn
    target_id = aws_instance.server-1.id
    port = 80
  
}

resource "aws_lb_target_group_attachment" "server2" {

    target_group_arn = aws_lb_target_group.my-tg.arn
    target_id = aws_instance.server-2.id
    port = 80
  
}