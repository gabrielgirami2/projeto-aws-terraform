# Define Região e o tipo de instância

variable "region" {
  description = "Região da AWS"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  default     = "t3.micro" # Tier gratuito
}