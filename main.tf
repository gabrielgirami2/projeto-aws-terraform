# 1. Cria a rede (VPC)
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "HelloWorld-VPC" }
}

# 2. Cria a sub-rede dentro da VPC
resource "aws_subnet" "main_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true # Para a máquina ter IP público
  tags = { Name = "HelloWorld-Subnet" }
}

# 3. Firewall (Security Group) para permitir SSH
resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.main_vpc.id
  name   = "allow_ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # CUIDADO: Isso libera para o mundo todo!
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 4. A máquina (EC2)
resource "aws_instance" "web_server" {
  ami           = "ami-0182f373e66f89c85" # Amazon Linux 2023 (us-east-1)
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = { Name = "HelloWorld-EC2" }
}

# 5. Porta de entrada (Internet Gateway)
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id
}

# 6. Rota para mandar o tráfego da rede para o Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# 7. Conecta a nossa sub-rede à essa rota
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.main_subnet.id
  route_table_id = aws_route_table.public_rt.id
}