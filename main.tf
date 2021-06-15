resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-3dd25040"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
resource "aws_instance" "myfirstinstance" {
  ami = "ami-0aeeebd8d2ab47354"
  instance_type = "t2.micro"
  subnet_id                   = "subnet-075ae036"
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  tags = {
    Name = "Ec2_Instance_Terraform"
    Os = "linux"
  }
}

