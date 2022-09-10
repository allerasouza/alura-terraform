##### us-east-1 #####
data "aws_vpc" "main" {
  id = "vpc-0ca5493417621a83b"
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto
  }

  tags = {
    Name = "ssh"
  }
}

##### us-east-2 #####
resource "aws_vpc" "main" {
  provider   = aws.us-east-2
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  provider   = aws.us-east-2
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "my_subnet"
  }
}

resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider    = aws.us-east-2
  name        = "acesso-ssh"
  description = "acesso-ssh"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto
  }

  tags = {
    Name = "ssh"
  }
  depends_on = [aws_vpc.main]
}