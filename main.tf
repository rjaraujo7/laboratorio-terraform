terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # backend "s3" {
  #   bucket         = "laboratorio-terraform-state-374320036543"
  #   key            = "laboratorio/terraform.tfstate"
  #   region         = "eu-west-1"
  #   dynamodb_table = "terraform-state-locks"
  #   encrypt        = true
  # }
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source      = "./modules/network"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  environment = "laboratorio"
}

module "compute" {
  source        = "./modules/compute"
  vpc_id        = module.network.vpc_id
  subnet_id     = module.network.subnet_id
  instance_type = var.instance_type
  environment   = var.environment
}

# resource "aws_s3_bucket" "miprimerbucket" {
#   bucket = var.bucket_name

#   tags = {
#     Environment = var.environment
#     ManagedBy   = "Terraform"
#   }
# }

# resource "aws_vpc" "mi_vpc" {
#   cidr_block           = "10.0.0.0/16"
#   enable_dns_hostnames = true

#   tags = {
#     Name        = "vpc-laboratorio"
#     Environment = var.environment
#   }
# }

# resource "aws_subnet" "mi_subnet" {
#   vpc_id            = aws_vpc.mi_vpc.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "${var.aws_region}a"

#   tags = {
#     Name = "subnet-laboratorio"
#   }
# }

# resource "aws_internet_gateway" "mi_gw" {
#   vpc_id = aws_vpc.mi_vpc.id

#   tags = {
#     Name = "laboratorio-igw"
#   }
# }

# resource "aws_route_table" "mi_rt" {
#   vpc_id = aws_vpc.mi_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.mi_gw.id
#   }

#   tags = {
#     Name = "laboratorio-rt"
#   }
# }

# resource "aws_route_table_association" "mi_rta" {
#   subnet_id      = aws_subnet.mi_subnet.id
#   route_table_id = aws_route_table.mi_rt.id
# }

# resource "aws_security_group" "mi_sg" {
#   name        = "permitir-shh-http"
#   description = "Permitir trafico SSH entrante y http web"
#   vpc_id      = aws_vpc.mi_vpc.id

#   ingress {
#     description = "Acceso SSH desde cualquier maquina"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "Acceso HTTP web Nginx"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     description = "Salida total a internet"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "sg-laboratorio"
#   }
# }

# resource "aws_instance" "mi_servidor" {
#   ami                         = "ami-0905a3c97561e0b69" #ID de la imagen representativo
#   instance_type               = var.instance_type
#   subnet_id                   = aws_subnet.mi_subnet.id
#   vpc_security_group_ids      = [aws_security_group.mi_sg.id]
#   associate_public_ip_address = true

#   user_data = <<-EOF
#               #!/bin/bash
#               apt-get update -y
#               apt-get install -y nginx
#               systemctl enable nginx
#               systemctl start nginx
#               echo "<h1>Nico! Mucha suerte en el insti! Nos vemos a la vuelta</h1>" > /var/www/html/index.html
#               EOF
#   tags = {
#     Name        = "servidor-laboratorio-web"
#     Environment = var.environment
#   }
# }

