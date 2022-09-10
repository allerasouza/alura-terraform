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
}
