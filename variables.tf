variable "aws_region" {
  description = "Region de AWS para el despliegue"
  type        = string
  default     = "eu-west-1"
}

variable "bucket_name" {
  description = "Nombre unico global para el bucket S3"
  type        = string
  default     = "mi-laboratorio-tf-ricardo-2026-09-06"
}

variable "environment" {
  description = "Entorno de ejecucion"
  type        = string
  default     = "Dev"
}

variable "instance_type" {
  description = "Tipo de instancia EC2 (capa gratuira)"
  type        = string
  default     = "t3.micro"
}