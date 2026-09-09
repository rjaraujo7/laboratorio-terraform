# output "s3_bucket_arn" {
#   description = "ARN identificador del bucket S3 creado"
#   value       = aws_s3_bucket.miprimerbucket.arn
# }

# output "s3_bucket_name" {
#   description = "Nombre asignado al bucket S3"
#   value       = aws_s3_bucket.miprimerbucket.bucket
# }

# output "ec2_instance_id" {
#   description = "ID de la instancia EC2"
#   value       = aws_instance.mi_servidor.id
# }

# output "ec2_private_ip" {
#   description = "IP privada de la instancia EC2"
#   value       = aws_instance.mi_servidor.private_ip
# }

output "servidor_web_url" {
  description = "URL publica del servidor Nginx"
  value       = "http://${module.compute.public_ip}"
}
