# PROJECT CHARTER — D2NS Multicloud Dashboard (FinOps)

## 1. Identificação do Projeto

**Nome do Projeto:** D2NS Multicloud Dashboard — FinOps
**Responsável:** Danilo Lima
**Tipo:** Projeto de estudo e portfólio
**Plataformas Cloud:** Amazon Web Services (AWS) · Microsoft Azure · Google Cloud Platform (GCP)
**Status:** Em desenvolvimento

---

## 2. Visão Geral

O **D2NS Multicloud Dashboard** é um projeto de portfólio independente do D2NS Cloud Platform (Study Hub), com arquitetura própria, dedicado a consolidar e apresentar o custo real das três principais nuvens públicas em um único painel.

O projeto contempla coletores de custo nativos por provedor, um hub central de ingestão e persistência, e uma aplicação web para visualização consolidada.

---

## 3. Justificativa

Empresas que operam em múltiplas nuvens frequentemente perdem visibilidade de custo por manter o acompanhamento fragmentado, um painel de billing por provedor. O projeto demonstra, na prática, como consolidar essa visão em uma única ferramenta — competência diretamente aplicável a ambientes multicloud reais.

---

## 4. Objetivo Geral

Projetar, provisionar e operar um dashboard de custo multicloud, com coleta automatizada via as APIs nativas de billing de cada provedor, seguindo boas práticas de FinOps, segurança e infraestrutura como código.

---

## 5. Objetivos Específicos

- Definir um contrato de API único para ingestão de dados de custo.
- Implementar um coletor serverless por provedor (AWS Lambda, Azure Function, GCP Cloud Function).
- Consumir as billing APIs nativas (Cost Explorer, Cost Management, Cloud Billing).
- Persistir o histórico de custo em banco relacional (PostgreSQL).
- Implementar um hub central que recebe e armazena os dados dos três coletores.
- Construir um painel web consolidado, com custo total e por provedor.
- Aplicar controle de orçamento (budget alerts) nas três contas cloud.
- Documentar as decisões técnicas e a arquitetura da solução.
- Manter o custo de operação próximo de zero, priorizando os free tiers.

---

## 6. Escopo do Projeto

### 6.1 Documentação

- Project Charter
- Roadmap
- Contrato de API
- Arquitetura da solução
- Diagramas
- Decisões técnicas

### 6.2 Coletores por Provedor

- **AWS:** Lambda + Cost Explorer API, agendado via EventBridge
- **Azure:** Function + Cost Management API, agendado via Timer Trigger
- **GCP:** Cloud Function + Cloud Billing Catalog API, agendado via Cloud Scheduler

### 6.3 Hub Central

- API própria de ingestão (`/api/ingest`)
- Autenticação por API key, uma por coletor
- Persistência em PostgreSQL via Sequelize

### 6.4 Aplicação — Painel de Custo

O painel permitirá:

- Visualizar o custo total consolidado das três clouds
- Visualizar o custo individual por provedor
- Visualizar o detalhamento (breakdown) por serviço
- Comparar o custo do mês atual com o mês anterior

### 6.5 Infraestrutura como Código

Provisionamento via Terraform, com módulos separados por provedor.

### 6.6 Observabilidade

- Logs dos coletores por provedor
- Alertas de falha de ingestão
- Budget alerts nativos em cada conta cloud

---

## 7. Escopo da Primeira Versão

### Incluído na primeira versão

- Contrato de API de ingestão definido.
- Modelo de dados de custo (PostgreSQL).
- Hub central recebendo e persistindo dados.
- Coletor AWS funcional (Lambda + Cost Explorer).
- Painel web exibindo o custo da AWS.

### Não incluído inicialmente

- Coletores Azure e GCP (entram em sprints seguintes).
- Comparador de preços de catálogo (pricing APIs).
- Consumo do free tier por conta.
- Alertas de anomalia de custo.
- Recomendação automatizada de otimização.
- Insights via IA (Claude API).
- Autenticação de usuários.
- Multi-tenant.

Esses itens poderão ser avaliados em versões futuras.

---

## 8. Requisitos Funcionais

O sistema deverá permitir:

- Receber eventos de custo via `/api/ingest`.
- Validar a origem do evento (`source`) pela API key.
- Persistir o evento no banco de dados.
- Consultar o custo mais recente por provedor.
- Consultar o histórico de custo por período.
- Exibir o custo consolidado das três clouds em um painel.

---

## 9. Requisitos Não Funcionais

- Persistência em PostgreSQL.
- Infraestrutura provisionada via Terraform.
- Código versionado no GitHub.
- Coletores executados como funções serverless (custo mínimo).
- Autenticação por API key entre coletores e hub.
- Documentação atualizada a cada sprint.
- Custo de operação controlado, priorizando os free tiers das três clouds.

---

## 10. Estratégia de Contas

Cada provedor terá uma conta/assinatura dedicada a este projeto, separada de outros projetos do ecossistema (D2NS Study Hub, BIA):

```text
AWS   → conta free tier própria
Azure → assinatura free tier própria
GCP   → conta free tier própria
```

---

## 11. Premissas

- Utilização de contas cloud dedicadas a este projeto, separadas de outros projetos do ecossistema.
- Priorização de recursos serverless e free tier em todas as clouds.
- Monitoramento constante dos custos das três contas.
- Contrato de API definido antes da implementação de qualquer coletor.
- Desenvolvimento incremental por sprint, seguindo o mesmo padrão de documentação do D2NS Cloud Platform.

---

## 12. Restrições

- Orçamento limitado.
- Ausência de equipe dedicada de desenvolvimento.
- Foco inicial em AWS, com Azure e GCP entrando em etapa posterior.
- Evitar componentes que aumentem custo sem necessidade imediata (ex.: NAT Gateway, Load Balancer).

---

## 13. Riscos

### Custos inesperados nas contas cloud

**Mitigação:** budget alerts configurados nas três contas antes de qualquer provisionamento; uso prioritário de serviços serverless.

### Complexidade de integrar três provedores diferentes

**Mitigação:** contrato de API único e genérico; implementação incremental (AWS primeiro, depois Azure e GCP).

### Divergência de formato entre as billing APIs

**Mitigação:** normalização de dados no próprio coletor, antes de enviar ao hub — o hub sempre recebe o mesmo formato, independente do provedor de origem.

### Perda de continuidade entre sessões de estudo

**Mitigação:** documentação por sprint; commits pequenos e frequentes.

---

## 14. Critérios de Sucesso

O projeto será considerado bem-sucedido quando:

- O contrato de API estiver documentado e implementado.
- O coletor AWS estiver enviando dados reais de custo para o hub.
- O painel exibir o custo real da conta AWS.
- Os três coletores estiverem integrados ao hub.
- O painel exibir o custo consolidado das três clouds.
- Os custos de operação do próprio projeto permanecerem próximos de zero.
- O projeto puder ser explicado tecnicamente em entrevistas.

---

## 15. Entregáveis

- Repositório organizado no GitHub.
- README completo.
- Project Charter.
- Roadmap.
- Contrato de API documentado.
- Código Terraform (por provedor).
- Coletores (AWS, Azure, GCP).
- Hub central (API + banco).
- Painel web.
- Documentação de arquitetura e decisões técnicas.

---

## 16. Tecnologias Previstas

### Cloud

- Amazon Web Services
- Microsoft Azure
- Google Cloud Platform

### Infraestrutura como Código

- Terraform

### Coletores

- AWS Lambda
- Azure Functions
- Google Cloud Functions

### Hub / Backend

- Node.js
- Express
- Sequelize

### Persistência

- PostgreSQL

### Front-end

- React
- Vite

### DevOps

- Git
- GitHub
- GitHub Actions

---

## 17. Estrutura de Alto Nível

```text
AWS Lambda      ──┐
Azure Function  ──┼──▶ Hub (/api/ingest) ──▶ PostgreSQL ──▶ Painel Web
GCP Function    ──┘
```

---

## 18. Estratégia de Execução

Execução incremental, por sprint — ver `ROADMAP.md`.

---

## 19. Governança do Projeto

- Documentação antes da implementação, quando aplicável.
- Commits pequenos e descritivos.
- Padronização de nomes e tags entre os três provedores.
- Revisão de custo antes da adoção de novos serviços.
- Registro das principais decisões arquiteturais.
- Nenhuma credencial versionada no repositório.

---

## 20. Aprovação do Projeto

Este documento formaliza o início do D2NS Multicloud Dashboard (FinOps) e estabelece seu objetivo, escopo, premissas, riscos, tecnologias e critérios de sucesso.

A evolução do projeto será registrada no arquivo `ROADMAP.md`.

---

## 21. Status Atual

```text
Status: Em desenvolvimento

Etapa atual:
Planejamento e definição do contrato de API

Próxima etapa:
Modelagem de dados e implementação do hub central
```
