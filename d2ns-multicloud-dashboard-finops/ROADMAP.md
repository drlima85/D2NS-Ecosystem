# ROADMAP — D2NS Multicloud Dashboard (FinOps)

## Visão Geral

Este roadmap apresenta a evolução planejada do **D2NS Multicloud Dashboard**, desde o contrato de API até a integração completa dos três provedores de nuvem.

A execução seguirá uma abordagem incremental, validando cada etapa antes de avançar.

---

# Status Atual

**Projeto:** Em desenvolvimento

**Fase Atual:** Planejamento e contrato de API

---

# Roadmap Geral

```text
Sprint 0
    ↓
Planejamento
    ↓
Contrato de API
    ↓
Modelo de Dados
    ↓
Hub Central
    ↓
Coletor AWS
    ↓
Painel Web
    ↓
Coletor Azure
    ↓
Coletor GCP
    ↓
Consumo de Free Tier
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
- [x] Project Charter
- [x] Roadmap
- [x] Contrato de API (`/api/ingest`)
- [x] Definição das contas cloud dedicadas (AWS, Azure, GCP)

Status:

✅ Concluído

---

# Sprint 1 — Modelo de Dados e Hub Central

## Objetivo

Construir o backend que recebe e persiste os eventos de custo.

### Entregas

- [ ] Modelagem da tabela de custo (Sequelize)
- [ ] Migrations
- [ ] Endpoint `POST /api/ingest`
- [ ] Autenticação por API key
- [ ] Endpoint `GET /api/costs` (consulta)
- [ ] Testes locais com dado simulado

Status:

⬜ Não iniciado

---

# Sprint 2 — Coletor AWS

## Objetivo

Implementar a primeira coleta real de custo, usando a AWS.

### Entregas

- [ ] IAM Role com permissão de leitura no Cost Explorer
- [ ] Lambda de coleta
- [ ] Agendamento via EventBridge (1x/dia)
- [ ] Envio do payload para `/api/ingest`
- [ ] Validação com dado real da conta

Status:

⬜ Não iniciado

---

# Sprint 3 — Painel Web

## Objetivo

Exibir o custo coletado em uma interface visual.

### Front-end

- [ ] React
- [ ] Vite
- [ ] Cards de custo por provedor
- [ ] Card de custo total consolidado

### Integração

- [ ] Consumo do endpoint `GET /api/costs`

Status:

⬜ Não iniciado

---

# Sprint 4 — Coletor Azure

## Objetivo

Estender a coleta para a Azure.

### Entregas

- [ ] Service Principal com permissão de leitura em Cost Management
- [ ] Azure Function de coleta
- [ ] Timer Trigger (1x/dia)
- [ ] Envio do payload para `/api/ingest`

Status:

⬜ Não iniciado

---

# Sprint 5 — Coletor GCP

## Objetivo

Estender a coleta para o GCP.

### Entregas

- [ ] Service Account com permissão de leitura em Billing
- [ ] Cloud Function de coleta
- [ ] Cloud Scheduler (1x/dia)
- [ ] Envio do payload para `/api/ingest`

Status:

⬜ Não iniciado

---

# Sprint 6 — Terraform

## Objetivo

Provisionar toda a infraestrutura como código, por provedor.

### Entregas

- [ ] Módulo Terraform AWS (Lambda, EventBridge, IAM)
- [ ] Módulo Terraform Azure (Function, Timer Trigger)
- [ ] Módulo Terraform GCP (Cloud Function, Scheduler)
- [ ] Terraform do hub central

Status:

⬜ Não iniciado

---

# Sprint 7 — Observabilidade e FinOps

## Objetivo

Adicionar controle e visibilidade sobre a operação do próprio projeto.

### Entregas

- [ ] Budget alerts nas três contas
- [ ] Logs de falha de ingestão
- [ ] Comparação de custo mês atual vs. anterior no painel

Status:

⬜ Não iniciado

---

# Evoluções Futuras

Os itens abaixo poderão ser implementados futuramente conforme a evolução do projeto.

## Funcionalidades

- Comparador de preços (pricing APIs, catálogo público)
- Percentual de consumo do free tier por conta
- Alerta de anomalia de custo
- Recomendação de otimização (rule-based)
- Botão "Explicar com IA" (Claude API)
- Histórico/tendência de custo (gráfico de linha)

## DevOps

- GitHub Actions (CI/CD)
- Testes automatizados

---

# Tecnologias

## Cloud

- Amazon Web Services
- Microsoft Azure
- Google Cloud Platform

## Infraestrutura

- Terraform

## Coletores

- AWS Lambda
- Azure Functions
- Google Cloud Functions

## Backend

- Node.js
- Express
- Sequelize

## Banco de Dados

- PostgreSQL

## Front-end

- React
- Vite

## DevOps

- Git
- GitHub

---

# Critérios de Conclusão

O projeto será considerado concluído (v1) quando:

- Os três coletores estiverem enviando dados reais para o hub.
- O painel exibir o custo consolidado das três clouds.
- Toda a infraestrutura estiver provisionada via Terraform.
- A documentação estiver completa e atualizada.
- O projeto puder ser apresentado como portfólio técnico completo.
