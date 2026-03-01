# Projeto: Infraestrutura AWS com Terraform (Hello World)

Este projeto demonstra o uso de **Infrastructure as Code (IaC)** para provisionar recursos na AWS de forma automatizada, versionável e idempotente.

## O que foi construído:
- **VPC & Subnet**: Rede isolada para a aplicação.
- **Internet Gateway**: Rota para permitir acesso à internet.
- **Security Group**: Firewall configurado para permitir acesso SSH (porta 22).
- **EC2 Instance**: Instância Amazon Linux 2023 (Free-tier).

## Pré-requisitos
- Terraform instalado (>= 1.0)
- AWS CLI configurado (`aws configure`)

## Como executar
1. Inicialize o diretório:
   `terraform init`
2. Visualize o plano de execução:
   `terraform plan`
3. Aplique as mudanças:
   `terraform apply`
4. Destrua a infraestrutura após o teste:
   `terraform destroy`

---
*Projeto desenvolvido para fins de estudo e prática de DevOps.*