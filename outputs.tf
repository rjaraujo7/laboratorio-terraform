output "s3_bucket_arn" {
  description = "ARN identificador del bucket S3 creado"
  value       = aws_s3_bucket.miprimerbucket.arn
}

output "s3_bucket_name" {
  description = "Nombre asignado al bucket S3"
  value       = aws_s3_bucket.miprimerbucket.bucket
}
