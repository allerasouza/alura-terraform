terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "dev" {
    count = 3
    ami = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"
    key_name = "terraform-alura"
    tags = {
      "Name" = "dev${count.index}"
    }
    vpc_security_group_ids = [aws_security_group.acesso-ssh.id]
}

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
