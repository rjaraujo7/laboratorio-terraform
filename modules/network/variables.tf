variable "vpc_cidr" {
  description = "Rango CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Rango CIDR para la subred publica"
  type        = string
  default     = "10.0.1.0/24"
}

variable "environment" {
  description = "Nombre del entorno (dev, prod)"
  type        = string
  default     = "laboratorio"
}
