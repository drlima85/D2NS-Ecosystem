# Sprint 0 — Foundation

## Objetivo

Criar a base do projeto **D2NS Multicloud Dashboard (FinOps)**, definindo o escopo, a documentação inicial e o contrato de comunicação entre os componentes multicloud, antes de qualquer implementação.

---

## O que foi realizado

- Definição do escopo do projeto: dashboard de custo consolidado das três clouds (AWS, Azure, GCP).
- Criação da documentação inicial:
  - PROJECT_CHARTER.md
  - ROADMAP.md
- Definição da arquitetura de alto nível (coletores independentes + hub central de ingestão).
- Definição do contrato de API de ingestão (`POST /api/ingest`), incluindo os payloads de eventos `cost` e `health`.
- Definição da estratégia de autenticação entre coletores e hub (API key por coletor).
- Definição da estratégia de contas cloud: uma conta/assinatura dedicada por provedor, separada de outros projetos do ecossistema (D2NS Study Hub, BIA).
- Levantamento dos custos estimados de operação (free tier em AWS, Azure e GCP).

---

## Decisões tomadas

- Manter o **D2NS Multicloud Dashboard** como projeto e arquitetura independentes do **D2NS Study Hub**, sem compartilhar infraestrutura entre eles.
- Iniciar a coleta de dados reais pela **AWS**, adicionando Azure e GCP em sprints posteriores.
- Utilizar **serviços serverless** (Lambda, Functions, Cloud Functions) para os coletores, priorizando operação dentro do free tier.
- Utilizar **PostgreSQL + Sequelize** para persistência no hub central, seguindo o mesmo padrão do restante do ecossistema.
- Adotar o mesmo padrão de documentação por Sprint utilizado no D2NS Cloud Platform, para manter consistência entre os projetos do ecossistema.
- Deixar comparador de preços, consumo de free tier e insights via IA como evoluções futuras, fora do escopo do MVP.

---

## Lições aprendidas

- Definir o contrato de API antes de qualquer coletor evita retrabalho de integração mais adiante.
- Separar a arquitetura deste projeto da arquitetura do Study Hub, mesmo fazendo parte do mesmo ecossistema, simplifica o desenvolvimento em paralelo.
- Mapear onde o free tier de cada provedor cobre o projeto, antes de iniciar, evita surpresas de custo.
- Manter o mesmo padrão de documentação entre projetos do ecossistema reforça a percepção de plataforma, não de projetos soltos.

---

## Próximo Sprint

### Sprint 1 — Modelo de Dados e Hub Central

Objetivos:

- Modelar a tabela de custo (Sequelize).
- Criar as migrations.
- Implementar o endpoint `POST /api/ingest`.
- Implementar autenticação por API key.
- Implementar o endpoint `GET /api/costs`.
- Validar o fluxo localmente com dado simulado.

---

## Status

**Sprint 0 concluído com sucesso.**

O projeto está com escopo, documentação e contrato de API definidos, pronto para iniciar a implementação do hub central e, em seguida, do primeiro coletor real (AWS).
