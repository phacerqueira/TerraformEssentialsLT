# Criação da VPC
resource "aws_vpc" "devopslabs01" {
  cidr_block = "10.1.0.0/24"

  tags = {
  Name = "devopslabs01"
  }
}

# Criação da ACL de rede para a VPC
resource "aws_default_network_acl" "devopslabs01" {
  default_network_acl_id = aws_vpc.devopslabs01.default_network_acl_id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
  Name = "devopslabs01"
  }  
}


# Criação do Grupo de Segurança
resource "aws_security_group" "devopslabs01" {
  name_prefix = "devopslabs01-"
  vpc_id = aws_vpc.devopslabs01.id

  // Regras de entrada (inbound)
  ingress {
    protocol    = "tcp"
    self        = true
    from_port   = 0
    to_port     = 22
    cidr_blocks = ["187.16.183.199/32"]
  }

  // Regras de saída (outbound)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
  Name = "devopslabs01"
  }
}

# Criação da Sub-Rede da VPC
resource "aws_subnet" "devopslabs01" {
  vpc_id                  = aws_vpc.devopslabs01.id
  cidr_block              = "10.1.0.0/28"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "devopslabs01"
  }
}

# Criação do Internet Gateway
resource "aws_internet_gateway" "devopslabs01" {
  vpc_id                  = aws_vpc.devopslabs01.id

  tags = {
    Name = "devopslabs01"
  }
}

# Criação da Tabela de Roteamento
resource "aws_route_table" "devopslabs01" {
  vpc_id = aws_vpc.devopslabs01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devopslabs01.id
  }

  tags = {
    Name = "devopslabs01"
  }
}

# Criação da Rota Default para Acesso à Internet
resource "aws_route" "devopslabs01" {
  route_table_id            = aws_route_table.devopslabs01.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.devopslabs01.id

}

# Associação da Subnet Pública com a Tabela de Roteamento
resource "aws_route_table_association" "tcb_blog_pub_association" {
  subnet_id      = aws_subnet.devopslabs01.id
  route_table_id = aws_route_table.devopslabs01.id
}