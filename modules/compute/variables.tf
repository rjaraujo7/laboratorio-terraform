variable "vpc_id" {
  description = "VPC ID donde crear el security group"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID donde levantar la instancia EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2 a levantar"
  type        = string
  default     = "t3.micro"
}

variable "environment" {
  description = "Nombre del entorno"
  type        = string
  default     = "laboratorio"
}