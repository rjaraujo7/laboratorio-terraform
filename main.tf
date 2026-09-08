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

resource "aws_s3_bucket" "miprimerbucket" {
  bucket = var.bucket_name

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_vpc" "mi_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name        = "vpc-laboratorio"
    Environment = var.environment
  }
}

resource "aws_subnet" "mi_subnet" {
  vpc_id            = aws_vpc.mi_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "subnet-laboratorio"
  }
}

resource "aws_security_group" "mi_sg" {
  name        = "permitir-shh"
  description = "Permitir trafico SSH entrante"
  vpc_id      = aws_vpc.mi_vpc.id

  ingress {
    description = "Acceso SSH desde cualquier maquina"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-laboratorio"
  }
}

resource "aws_instance" "mi_servidor" {
  ami                    = "ami-0905a3c97561e0b69" #ID de la imagen representativo
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.mi_subnet.id
  vpc_security_group_ids = [aws_security_group.mi_sg.id]

  tags = {
    Name        = "vpc-laboratorio"
    Environment = var.environment
  }
}

