# D2NS Cloud Platform

> Plataforma Cloud construída como projeto de portfólio para demonstrar, na prática, conhecimentos em AWS, Terraform, segurança, automação, containers, DevOps e arquitetura de soluções.

---

## Status do projeto

![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)
![AWS](https://img.shields.io/badge/cloud-AWS-orange)
![Terraform](https://img.shields.io/badge/IaC-Terraform-purple)
![Docker](https://img.shields.io/badge/container-Docker-blue)

| Sprint | Entrega | Status |
|---|---|---|
| Sprint 01 | Rede AWS e infraestrutura base | ✅ Concluída |
| Sprint 02 | Computação segura e bootstrap automatizado | ✅ Concluída |
| Sprint 03 | Camada de dados e integração entre serviços | ⏳ Próxima |

---

## Sobre o projeto

A **D2NS Cloud Platform** é um projeto de portfólio criado para demonstrar a construção progressiva de uma plataforma Cloud completa.

O projeto contempla planejamento arquitetural, provisionamento da infraestrutura, segurança, automação, aplicação containerizada, banco de dados, observabilidade, integração contínua e documentação técnica.

Toda a infraestrutura é implementada como código com Terraform e evolui por sprints documentadas.

---

## Objetivos

- Projetar uma arquitetura Cloud organizada por camadas.
- Provisionar recursos AWS com Terraform.
- Aplicar Infraestrutura como Código.
- Utilizar autenticação e autorização baseadas em IAM.
- Reduzir a exposição de serviços administrativos.
- Automatizar a configuração inicial das instâncias.
- Desenvolver e executar uma aplicação containerizada.
- Integrar aplicação e PostgreSQL.
- Implementar observabilidade e automações DevOps.
- Produzir documentação técnica para portfólio.

---

## Aplicação planejada

A plataforma hospedará a aplicação **D2NS Study Hub**, criada para centralizar conteúdos relacionados a Cloud Computing e desenvolvimento profissional.

A aplicação deverá permitir organizar:

- documentações;
- cursos;
- laboratórios;
- vídeos;
- repositórios;
- artigos;
- links úteis.

Ela será utilizada como prova de conceito para validar a infraestrutura criada no projeto.

---

## Arquitetura atual

```text
                         Internet
                             │
                             ▼
                    Internet Gateway
                             │
                             ▼
                   Route Table pública
                             │
                             ▼
┌──────────────────────────────────────────────────────────┐
│                         VPC                              │
│                    10.20.0.0/16                         │
│                                                          │
│  ┌─────────────────────────────┐                         │
│  │       Subnet pública        │                         │
│  │       10.20.1.0/24          │                         │
│  │                             │                         │
│  │  EC2 Amazon Linux 2023      │                         │
│  │  ├── Security Group         │                         │
│  │  ├── IAM Instance Profile   │                         │
│  │  ├── Session Manager        │                         │
│  │  ├── Git                    │                         │
│  │  └── Docker                 │                         │
│  └─────────────────────────────┘                         │
│                                                          │
│  ┌─────────────────────────────┐                         │
│  │       Subnet privada        │                         │
│  │       10.20.2.0/24          │                         │
│  │                             │                         │
│  │       Camada de dados       │                         │
│  │         planejada           │                         │
│  └─────────────────────────────┘                         │
└──────────────────────────────────────────────────────────┘
```

A arquitetura será expandida progressivamente nas próximas sprints.

---

## Recursos já implementados

### Rede

- VPC dedicada;
- Internet Gateway;
- subnet pública;
- subnet privada;
- Route Table pública;
- rota padrão para Internet;
- associação da Route Table à subnet pública;
- padronização de nomes e tags;
- outputs da infraestrutura.

### Segurança e identidade

- Security Group sem regras de entrada;
- ausência de exposição da porta SSH;
- acesso administrativo pelo AWS Systems Manager;
- IAM Role para EC2;
- IAM Instance Profile;
- policy `AmazonSSMManagedInstanceCore`;
- política dedicada para o usuário Terraform;
- princípio de menor privilégio.

### Computação

- EC2 `t3.micro`;
- Amazon Linux 2023;
- AMI consultada dinamicamente;
- volume raiz `gp3` de 8 GB;
- criptografia do volume;
- IMDSv2 obrigatório;
- endereço IP público;
- substituição automática quando o User Data muda.

### Bootstrap automatizado

O User Data prepara a EC2 durante o primeiro boot:

- atualiza os pacotes;
- instala Git;
- instala Docker;
- inicializa e habilita o Docker;
- adiciona `ec2-user` ao grupo `docker`;
- cria um log de conclusão.

---

## Decisões de segurança

A EC2 não possui porta SSH aberta nem Key Pair.

O acesso administrativo é realizado pelo Session Manager:

```text
Administrador
      │
      ▼
IAM
      │
      ▼
AWS Systems Manager
      │
      ▼
EC2
```

Essa abordagem reduz a superfície de ataque, elimina o gerenciamento de chaves privadas e centraliza o controle de acesso em IAM.

---

## Tecnologias

### Cloud

- Amazon Web Services
- Amazon EC2
- Amazon VPC
- AWS IAM
- AWS Systems Manager
- Amazon EBS

### Infraestrutura como Código

- Terraform
- HashiCorp AWS Provider

### Sistema e automação

- Amazon Linux 2023
- Bash
- cloud-init
- Git
- Docker

### Aplicação planejada

- React
- Vite
- Node.js
- Express
- Sequelize
- PostgreSQL
- Docker Compose

### DevOps planejado

- GitHub Actions
- CI/CD
- CloudWatch
- logs e monitoramento

---

## Estrutura atual do projeto

```text
d2ns-cloud-platform/
│
├── app/
├── assets/
├── docker/
├── docs/
│   ├── architecture/
│   ├── decisions/
│   ├── diagrams/
│   └── sprints/
│       ├── SPRINT-01-network.md
│       └── SPRINT-02-compute.md
│
├── infrastructure/
│   ├── networking/
│   └── terraform/
│       ├── userdata/
│       │   └── bootstrap.sh
│       ├── compute.tf
│       ├── iam.tf
│       ├── locals.tf
│       ├── network.tf
│       ├── outputs.tf
│       ├── providers.tf
│       ├── security.tf
│       ├── variables.tf
│       └── versions.tf
│
├── monitoring/
├── scripts/
├── tests/
├── .gitignore
├── PROJECT_CHARTER.md
├── ROADMAP.md
└── README.md
```

---

## Documentação das sprints

### Sprint 01 — Rede AWS

Provisionamento da infraestrutura de rede:

- VPC;
- Internet Gateway;
- subnets pública e privada;
- Route Table pública;
- rota para Internet;
- associação da subnet;
- outputs;
- validações no Terraform e na AWS.

Documentação:

```text
docs/sprints/SPRINT-01-network.md
```

### Sprint 02 — Computação e bootstrap

Provisionamento da camada de computação:

- Security Group;
- IAM Role;
- IAM Instance Profile;
- EC2;
- Session Manager;
- User Data;
- instalação automática de Git e Docker;
- validação do bootstrap.

Documentação:

```text
docs/sprints/SPRINT-02-compute.md
```

---

## Como validar a infraestrutura

No diretório:

```text
infrastructure/terraform
```

Execute:

```bash
terraform fmt -check
terraform validate
terraform plan
```

Após o provisionamento, o resultado esperado do plano é:

```text
No changes. Your infrastructure matches the configuration.
```

---

## Roadmap

### Fase 1 — Planejamento

- [x] Estrutura do projeto
- [x] README inicial
- [x] Project Charter
- [x] Roadmap
- [x] Arquitetura inicial

### Fase 2 — Infraestrutura base

- [x] Terraform
- [x] VPC
- [x] Internet Gateway
- [x] Route Table pública
- [x] Subnet pública
- [x] Subnet privada
- [x] Security Group
- [x] IAM Role
- [x] IAM Instance Profile
- [x] EC2
- [x] Session Manager
- [x] User Data
- [x] Bootstrap com Git e Docker
- [ ] Camada de dados
- [ ] Amazon RDS PostgreSQL
- [ ] Segurança entre aplicação e banco

### Fase 3 — D2NS Study Hub

- [ ] Arquitetura da aplicação
- [ ] Banco PostgreSQL
- [ ] API REST
- [ ] Frontend React e Vite
- [ ] Containerização
- [ ] Deploy na AWS

### Fase 4 — DevOps

- [ ] GitHub Actions
- [ ] validação automatizada do Terraform
- [ ] build automatizado
- [ ] deploy automatizado

### Fase 5 — Observabilidade

- [ ] CloudWatch
- [ ] centralização de logs
- [ ] métricas
- [ ] alarmes
- [ ] dashboards

---

## Principais aprendizados até agora

- organização de projetos Terraform;
- dependência entre recursos AWS;
- uso de variáveis e locals;
- padronização de nomes e tags;
- diferença entre IAM e Security Groups;
- diferença entre Trust Policy e Permission Policy;
- princípio de menor privilégio;
- acesso administrativo sem SSH;
- bootstrap com User Data;
- reprodutibilidade de infraestrutura;
- documentação técnica por sprint.

---

## Próxima etapa

A próxima etapa será a **Sprint 03 — Camada de Dados**, com foco em:

- PostgreSQL gerenciado;
- subnets privadas para banco de dados;
- Security Group específico para o RDS;
- comunicação restrita entre aplicação e banco;
- gerenciamento seguro de credenciais;
- preparação da aplicação para consumir o banco.

---

## Licença

Este projeto foi desenvolvido para fins de estudo, demonstração técnica e composição de portfólio.

Consulte o arquivo [LICENSE](../LICENSE) para mais informações.