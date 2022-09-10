# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# }

data "aws_vpc" "main" {
  id = "vpc-0ca5493417621a83b"
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["191.13.39.108/32"]
  }

  tags = {
    Name = "ssh"
  }
}