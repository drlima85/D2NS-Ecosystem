variable "aws_region" {
  description = "Região AWS utilizada pelo projeto"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto utilizado na nomenclatura dos recursos"
  type        = string
  default     = "d2ns-cloud-platform"
}

variable "environment" {
  description = "Ambiente da infraestrutura"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "Bloco CIDR utilizado pela VPC do projeto"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.20.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.20.2.0/24"
}

variable "availability_zone" {
  default = "us-east-1a"
}
