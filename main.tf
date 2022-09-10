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

provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
}

resource "aws_instance" "dev" {
  count         = 3
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name      = "terraform-alura"
  tags = {
    "Name" = "dev${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.acesso-ssh.id]
}

resource "aws_instance" "dev4" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name      = "terraform-alura"
  tags = {
    "Name" = "dev4"
  }
  vpc_security_group_ids = [aws_security_group.acesso-ssh.id]
  depends_on             = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name      = "terraform-alura"
  tags = {
    "Name" = "dev5"
  }
  vpc_security_group_ids = [aws_security_group.acesso-ssh.id]
}

resource "aws_instance" "dev6" {
  provider      = aws.us-east-2
  ami           = "ami-0568773882d492fc8"
  instance_type = "t2.micro"
  key_name      = "terraform-alura"
  tags = {
    "Name" = "dev6"
  }
  vpc_security_group_ids = [aws_security_group.acesso-ssh-us-east-2.id]
  subnet_id              = aws_subnet.my_subnet.id
}

resource "aws_s3_bucket" "dev4" {
  bucket = "aaslabs-dev4"

  tags = {
    Name = "aaslabs-dev4"
  }
}

resource "aws_s3_bucket_acl" "dev4" {
  bucket = aws_s3_bucket.dev4.id
  acl    = "private"
}