terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Security group allowing inbound SSH (port 22), inbound HTTP (port 80) and
# all outbound traffic. Created in the account's default VPC.
# The two inbound rules answer different questions on purpose: SSH is for the
# operator alone and should be locked to a single address, while HTTP is for
# visitors and is meant to be open. Hence two separate CIDR variables.
resource "aws_security_group" "ssh" {
  name        = "${var.instance_name}-ssh"
  description = "Allow SSH inbound access"

  ingress {
    description = "SSH from allowed CIDR"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
  }

  ingress {
    description = "HTTP from allowed CIDR"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.http_allowed_cidr]
  }
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.instance_name}-ssh"
  }
}

resource "aws_instance" "demo" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = {
    Name = var.instance_name
  }
}
