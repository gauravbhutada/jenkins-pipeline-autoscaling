resource "aws_route_table" "prt" {
    vpc_id = aws_vpc.main.id  

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "sub1_ass" {
  subnet_id = aws_subnet.sub1.id
  route_table_id = aws_route_table.prt.id
}

resource "aws_route_table_association" "sub2_ass" {
    subnet_id = aws_subnet.sub2.id
    route_table_id = aws_route_table.prt.id
}