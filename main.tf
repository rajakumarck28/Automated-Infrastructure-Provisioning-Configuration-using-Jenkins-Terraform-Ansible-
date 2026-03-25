resource "aws_instance" "my_instance" {
  ami = "ami-0aaa636894689fa47"
  instance_type = "t3.micro"
  key_name = "docker"

  
}

resource "aws_vpc" "my_vpc" {  
  cidr_block = "10.16.0.0/16"

}


resource "aws_security_group" "my_sg" {
  name        = "my_sg"
  vpc_id      = aws_vpc.my_vpc.id


}

resource "aws_vpc_security_group_ingress_rule" "my_sg_ib1" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4         = aws_vpc.my_vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "my_sg_ib2" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4         = aws_vpc.my_vpc.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "my_sg_ob" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    gateway_id = aws_internet_gateway.my_ig.id
  }
}

resource "aws_internet_gateway" "my_ig" {
  vpc_id = aws_vpc.my_vpc.id
}
