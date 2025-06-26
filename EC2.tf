resource "aws_instance" "server-1" {

    ami = "ami-020cba7c55df1f615"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.sub1.id
    vpc_security_group_ids = [aws_security_group.my-sg.id]

    user_data = base64encode(<<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install nginx -y
              systemctl start nginx
              systemctl enable nginx
              echo "Hello from Gaurav! This is server 1." > /var/www/html/index.html
            EOF
		)


    tags = {
        Name = "Server-1"
    }      
}

resource "aws_instance" "server-2" {

    ami = "ami-084568db4383264d4"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.sub2.id
    vpc_security_group_ids = [aws_security_group.my-sg.id]

    user_data = base64encode(<<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install nginx -y
              systemctl start nginx
              systemctl enable nginx
              echo "Hello from Gaurav! This is server 2." > /var/www/html/index.html
            EOF
		)
    
    tags = {
        Name = "Server-2"
    }
  
}