# Sprint 01 - AWS Network Foundation

## Objetivo

Nesta primeira sprint, foi criada a infraestrutura base da AWS utilizando Terraform.

O objetivo foi estabelecer a fundação da plataforma D2NS Cloud Platform seguindo os princípios de Infrastructure as Code (IaC), permitindo que toda a infraestrutura possa ser provisionada de forma automatizada, reproduzível e versionada.

---

# Arquitetura

> Em fase de criação

---

# Recursos provisionados

Durante esta sprint foram criados os seguintes recursos:

- VPC
- Internet Gateway
- Public Subnet
- Private Subnet
- Public Route Table
- Route para Internet
- Route Table Association
- Terraform Outputs

---

# Estrutura do projeto

```text
infrastructure/
└── terraform/
    ├── versions.tf
    ├── providers.tf
    ├── variables.tf
    ├── locals.tf
    ├── network.tf
    ├── outputs.tf
    └── terraform.tfvars
```

---

# Conceitos aplicados

Durante esta sprint foram utilizados diversos conceitos fundamentais da AWS e do Terraform.

## Terraform

- Providers
- Variables
- Locals
- Outputs
- Terraform State
- Resource Dependencies

## AWS

- Virtual Private Cloud (VPC)
- CIDR
- Internet Gateway
- Public Subnet
- Private Subnet
- Route Tables
- Route Associations

---

# Validação

Após o provisionamento, a infraestrutura foi validada utilizando:

```bash
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
```

Também foi realizada a validação diretamente no Console AWS para confirmar:

- VPC criada corretamente
- Internet Gateway associado
- Subnets configuradas
- Route Table criada
- Associação entre Route Table e Public Subnet

---

# Evidências

As imagens desta sprint serão adicionadas após a edição para destacar os principais recursos provisionados.

---

# Lições aprendidas

Durante esta sprint foram consolidados conhecimentos importantes sobre:

- Infrastructure as Code
- Estrutura de projetos Terraform
- Organização de código utilizando arquivos separados
- Provisionamento de recursos AWS
- Dependências entre recursos
- Boas práticas de versionamento da infraestrutura

---

# Próxima Sprint

Na Sprint 02 será realizado o provisionamento da camada de computação da plataforma, incluindo:

- Security Groups
- IAM Role
- EC2
- AWS Systems Manager
- User Data
- Docker
- Preparação para deploy da aplicação