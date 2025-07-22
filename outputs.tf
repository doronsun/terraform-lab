output "instance_public_ip" {
  value       = aws_instance.web.public_ip
  description = "ה-IP הציבורי של האינסטנס"
}

