# Imprime o IP público da instância

output "instance_public_ip" {
  description = "O IP público da sua instância"
  value       = aws_instance.web_server.public_ip
}