resource "aws_security_group" "app" {
  name        = "${local.name_prefix}-app-sg"
  description = "Security Group da EC2 do D2NS Study Hub"
  vpc_id      = aws_vpc.main.id

  egress {
    description = "Permite comunicacao de saida"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.name_prefix}-app-sg"
  }
}