provider "aws" {
  region = "us-east-2"
}

data "aws_vpc" "default_vpc" {
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls_prod"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.default_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.default_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "web" {
  ami           = "xxx"
  instance_type = "t3.micro"
}
