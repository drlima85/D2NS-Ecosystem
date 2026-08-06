# D2NS Cloud Platform

> Projeto de portfólio desenvolvido para demonstrar a construção progressiva de uma plataforma Cloud utilizando AWS, Terraform, Docker, DevOps e boas práticas de arquitetura e segurança.

---

## 📖 Sobre o Projeto

A **D2NS Cloud Platform** é um projeto criado para demonstrar, na prática, a construção de uma solução Cloud completa.

O projeto contempla planejamento da arquitetura, provisionamento da infraestrutura, segurança, automação, aplicação containerizada, banco de dados, observabilidade e documentação técnica.

A evolução ocorre por sprints, com as implementações e decisões técnicas registradas no GitHub.

---

## 🎯 Objetivos

- Demonstrar conhecimentos em Arquitetura Cloud.
- Aplicar Infraestrutura como Código.
- Provisionar recursos AWS utilizando Terraform.
- Aplicar boas práticas de segurança e menor privilégio.
- Automatizar configurações e processos.
- Implementar uma aplicação containerizada.
- Integrar aplicação e banco PostgreSQL.
- Construir documentação técnica para portfólio.

---

## 💻 Aplicação

Como prova de conceito da infraestrutura, será desenvolvida a aplicação **D2NS Study Hub**.

O objetivo da aplicação é centralizar conteúdos relacionados à Computação em Nuvem, permitindo organizar:

- documentações;
- cursos;
- laboratórios;
- vídeos;
- repositórios;
- artigos;
- links úteis.

A aplicação será utilizada para validar a infraestrutura provisionada na AWS.

---

## ☁️ Tecnologias

### Cloud

- Amazon Web Services
- Amazon VPC
- Amazon EC2
- AWS IAM
- AWS Systems Manager

### Infraestrutura e automação

- Terraform
- Bash
- Git
- Docker
- Docker Compose

### Aplicação planejada

- React
- Vite
- Node.js
- Express
- Sequelize
- PostgreSQL

### DevOps planejado

- GitHub Actions
- Amazon CloudWatch
- CI/CD

---

## 🏗️ Arquitetura

A arquitetura segue os princípios de:

- Infraestrutura como Código;
- Security by Default;
- Least Privilege;
- automação;
- padronização;
- documentação contínua.

A arquitetura atual contempla:

- VPC dedicada;
- subnet pública para a camada de computação;
- subnet privada reservada para a camada de dados;
- EC2 com Amazon Linux 2023;
- acesso administrativo via AWS Systems Manager;
- bootstrap automatizado com Git e Docker.

> O diagrama oficial da arquitetura será incluído após sua criação no Draw.io.

---

## 🚀 Status do Projeto

| Sprint | Entrega | Status |
|---|---|---|
| Sprint 01 | Rede AWS e infraestrutura base | ✅ Concluída |
| Sprint 02 | Computação segura e bootstrap automatizado | ✅ Concluída |
| Sprint 03 | Camada de dados e integração com PostgreSQL | ⏳ Próxima |

---

## ✅ Recursos Implementados

### Sprint 01 — Networking

- VPC dedicada;
- Internet Gateway;
- subnet pública;
- subnet privada;
- Route Table pública;
- rota padrão para a Internet;
- associação da subnet pública;
- padronização de nomes, tags e outputs.

### Sprint 02 — Compute

- Security Group sem regras de entrada;
- IAM Role e IAM Instance Profile;
- EC2 Amazon Linux 2023;
- acesso via AWS Systems Manager;
- ausência de SSH e Key Pair;
- volume EBS criptografado;
- IMDSv2 obrigatório;
- User Data;
- instalação automática de Git e Docker.

---

## 📚 Documentação

A evolução do projeto está documentada por sprint:

- [Sprint 01 — Rede AWS](docs/sprints/SPRINT-01-network.md)
- [Sprint 02 — Computação e Bootstrap](docs/sprints/SPRINT-02-compute.md)
- [Project Charter](PROJECT_CHARTER.md)
- [Roadmap](ROADMAP.md)

---

## 🗺️ Roadmap

### Fase 1 — Planejamento

- [x] Estrutura inicial do projeto
- [x] README
- [x] Project Charter
- [x] Roadmap
- [x] Arquitetura inicial

### Fase 2 — Infraestrutura

- [x] Terraform
- [x] VPC
- [x] Internet Gateway
- [x] Route Table
- [x] Subnets
- [x] Security Group
- [x] IAM Role
- [x] IAM Instance Profile
- [x] EC2
- [x] Systems Manager
- [x] User Data
- [x] Bootstrap com Git e Docker
- [ ] Amazon RDS PostgreSQL
- [ ] Segurança entre aplicação e banco

### Fase 3 — D2NS Study Hub

- [ ] Arquitetura da aplicação
- [ ] API REST
- [ ] Frontend React e Vite
- [ ] Banco PostgreSQL
- [ ] Containerização
- [ ] Deploy na AWS

### Fase 4 — DevOps

- [ ] GitHub Actions
- [ ] Validação automatizada do Terraform
- [ ] Build automatizado
- [ ] Deploy automatizado

### Fase 5 — Observabilidade

- [ ] CloudWatch
- [ ] Logs
- [ ] Métricas
- [ ] Alarmes
- [ ] Dashboards

---

## 🎯 Objetivo Final

Ao final do projeto, será possível demonstrar conhecimentos em:

- AWS;
- Terraform;
- Docker;
- PostgreSQL;
- Node.js;
- React;
- DevOps;
- segurança;
- observabilidade;
- Infraestrutura como Código;
- Arquitetura Cloud.

Tudo isso por meio de uma plataforma funcional, documentada e construída progressivamente seguindo boas práticas utilizadas em ambientes corporativos.

---

## 📄 Licença

Este projeto foi desenvolvido para fins de estudo, demonstração técnica e composição de portfólio.

Consulte o arquivo [LICENSE](../LICENSE) para mais informações.