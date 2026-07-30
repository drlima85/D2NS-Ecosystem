# ROADMAP — D2NS Cloud Platform

## Visão Geral

Este roadmap apresenta a evolução planejada da **D2NS Cloud Platform**, desde a documentação inicial até a implementação completa da infraestrutura, aplicação, automação e observabilidade.

A execução seguirá uma abordagem incremental, permitindo validar cada etapa antes de avançar para a próxima.

---

# Status Atual

**Projeto:** Em desenvolvimento

**Fase Atual:** Planejamento da Arquitetura

---

# Roadmap Geral

```text
Sprint 0
    ↓
Planejamento
    ↓
Arquitetura
    ↓
Terraform
    ↓
Infraestrutura AWS
    ↓
D2NS Study Hub
    ↓
Docker
    ↓
Deploy
    ↓
CI/CD
    ↓
Observabilidade
    ↓
Evoluções Futuras
```

---

# Sprint 0 — Planejamento

## Objetivo

Definir toda a estrutura do projeto.

### Entregas

- [x] Estrutura do repositório
- [x] README
- [x] Project Charter
- [x] Roadmap
- [x] License
- [x] Git Ignore
- [x] Organização dos diretórios
- [x] Estratégia do projeto

Status:

✅ Concluído

---

# Sprint 1 — Arquitetura Cloud

## Objetivo

Planejar toda a arquitetura da solução antes da implementação.

### Entregas

- [x] Arquitetura de Rede AWS
- [ ] Arquitetura da Aplicação
- [ ] Diagrama da Arquitetura
- [ ] ADRs (Architecture Decision Records)

Status:

🟡 Em andamento

---

# Sprint 2 — Infraestrutura como Código

## Objetivo

Provisionar toda a infraestrutura utilizando Terraform.

### Entregas

- [ ] VPC
- [ ] Internet Gateway
- [ ] Route Tables
- [ ] Public Subnets
- [ ] Private Subnets
- [ ] Security Groups
- [ ] IAM
- [ ] EC2
- [ ] Amazon RDS

Status:

⬜ Não iniciado

---

# Sprint 3 — D2NS Study Hub

## Objetivo

Desenvolver a aplicação que validará a infraestrutura.

### Front-end

- [ ] React
- [ ] Vite

### Back-end

- [ ] Node.js
- [ ] Express
- [ ] Sequelize

### Banco

- [ ] PostgreSQL

### Funcionalidades

- [ ] Cadastro de conteúdos
- [ ] Listagem
- [ ] Exclusão
- [ ] Marcar como importante

Status:

⬜ Não iniciado

---

# Sprint 4 — Docker

## Objetivo

Containerizar toda a solução.

### Entregas

- [ ] Dockerfile Front-end
- [ ] Dockerfile Back-end
- [ ] Docker Compose
- [ ] Variáveis de ambiente

Status:

⬜ Não iniciado

---

# Sprint 5 — Deploy AWS

## Objetivo

Executar a aplicação utilizando a infraestrutura criada.

### Entregas

- [ ] Deploy da aplicação
- [ ] Comunicação com PostgreSQL
- [ ] Testes
- [ ] Validação

Status:

⬜ Não iniciado

---

# Sprint 6 — DevOps

## Objetivo

Automatizar o ciclo de build e deploy.

### Entregas

- [ ] GitHub Actions
- [ ] Build Automatizado
- [ ] Deploy Automatizado

Status:

⬜ Não iniciado

---

# Sprint 7 — Observabilidade

## Objetivo

Monitorar infraestrutura e aplicação.

### Entregas

- [ ] CloudWatch
- [ ] Logs
- [ ] Métricas
- [ ] Alarmes

Status:

⬜ Não iniciado

---

# Sprint 8 — FinOps

## Objetivo

Aplicar boas práticas de otimização de custos.

### Entregas

- [ ] Revisão da arquitetura
- [ ] Avaliação de custos
- [ ] Recursos ociosos
- [ ] Estratégias de otimização

Status:

⬜ Não iniciado

---

# Evoluções Futuras

Os itens abaixo poderão ser implementados futuramente conforme a evolução do projeto.

## Infraestrutura

- Auto Scaling
- Load Balancer
- NAT Gateway
- AWS Backup

## Segurança

- AWS WAF
- AWS Secrets Manager
- AWS KMS

## Aplicação

- Login
- Usuários
- Dashboard
- Pesquisa
- Filtros

## DevOps

- Testes automatizados
- Pipeline completo
- Versionamento automático

## Observabilidade

- Dashboards
- Alertas avançados

---

# Tecnologias

## Cloud

- Amazon Web Services

## Infraestrutura

- Terraform

## Containers

- Docker
- Docker Compose

## Banco de Dados

- PostgreSQL

## Aplicação

- React
- Vite
- Node.js
- Express
- Sequelize

## DevOps

- Git
- GitHub
- GitHub Actions

## Observabilidade

- Amazon CloudWatch

---

# Critérios de Conclusão

O projeto será considerado concluído quando:

- Toda a infraestrutura puder ser criada via Terraform.
- A aplicação D2NS Study Hub estiver executando na AWS.
- O banco PostgreSQL estiver integrado.
- Toda a documentação estiver concluída.
- O deploy estiver automatizado.
- A solução possuir monitoramento básico.
- O projeto puder ser apresentado como portfólio técnico completo.
