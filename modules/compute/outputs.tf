output "public_ip" {
  description = "IP publica asignada a la instancia EC2"
  value       = aws_instance.web_server.public_ip
}