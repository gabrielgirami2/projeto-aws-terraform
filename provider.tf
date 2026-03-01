# Define qual provedor de nuvem vamos usar
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configura o acesso à AWS
provider "aws" {
  region = "us-east-1"
}