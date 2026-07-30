# PROJECT CHARTER — D2NS Cloud Platform

## 1. Identificação do Projeto

**Nome do Projeto:** D2NS Cloud Platform  
**Aplicação:** D2NS Study Hub  
**Responsável:** Danilo Lima  
**Tipo:** Projeto de estudo e portfólio  
**Plataforma Cloud:** Amazon Web Services (AWS)  
**Status:** Em desenvolvimento  

---

## 2. Visão Geral

A **D2NS Cloud Platform** é um projeto de portfólio desenvolvido para demonstrar a construção de uma plataforma Cloud moderna, segura, automatizada e documentada.

O projeto contempla o planejamento da arquitetura, provisionamento da infraestrutura, implementação de segurança, containerização, deploy, observabilidade e automação.

Como prova de conceito da infraestrutura, será desenvolvida a aplicação **D2NS Study Hub**, responsável por centralizar conteúdos e materiais de estudo relacionados à Computação em Nuvem.

---

## 3. Justificativa

Projetos de infraestrutura isolados nem sempre demonstram de forma clara como os recursos Cloud se integram para entregar uma solução funcional.

A D2NS Cloud Platform foi criada para demonstrar o ciclo completo de uma solução:

```text
Planejamento
    ↓
Arquitetura
    ↓
Infraestrutura como Código
    ↓
Provisionamento na AWS
    ↓
Aplicação
    ↓
Banco de Dados
    ↓
Containers
    ↓
Deploy
    ↓
Automação
    ↓
Monitoramento
```

Dessa forma, o projeto permite aplicar conhecimentos técnicos em um cenário próximo ao encontrado em ambientes corporativos.

---

## 4. Objetivo Geral

Projetar, provisionar, documentar e operar uma plataforma Cloud utilizando Amazon Web Services, Terraform, Docker e boas práticas de Arquitetura Cloud, Segurança e DevOps.

A infraestrutura será validada por meio da aplicação **D2NS Study Hub**.

---

## 5. Objetivos Específicos

- Planejar uma arquitetura Cloud organizada e escalável.
- Provisionar recursos AWS utilizando Terraform.
- Implementar uma rede com VPC, subnets públicas e privadas.
- Aplicar segmentação e controle de acesso por Security Groups.
- Utilizar Amazon EC2 para execução da aplicação.
- Utilizar Amazon RDS PostgreSQL para persistência dos dados.
- Utilizar AWS Systems Manager para acesso administrativo.
- Evitar exposição desnecessária de portas administrativas.
- Containerizar a aplicação utilizando Docker.
- Implementar a aplicação D2NS Study Hub.
- Documentar as decisões técnicas e arquiteturais.
- Aplicar práticas de controle de versão com Git e GitHub.
- Preparar a solução para automação de build e deploy.
- Implementar monitoramento e observabilidade.
- Aplicar práticas básicas de FinOps e otimização de custos.

---

## 6. Escopo do Projeto

O projeto será dividido em componentes integrados.

### 6.1 Documentação

A documentação incluirá:

- Project Charter
- Roadmap
- Planejamento das sprints
- Arquitetura de rede
- Arquitetura da aplicação
- Diagramas
- Decisões técnicas
- Procedimentos de implantação
- Lições aprendidas

### 6.2 Infraestrutura AWS

A infraestrutura prevista inclui:

- Amazon VPC
- Subnets públicas
- Subnets privadas
- Internet Gateway
- Route Tables
- Security Groups
- Amazon EC2
- Amazon RDS PostgreSQL
- AWS Identity and Access Management
- AWS Systems Manager
- Amazon CloudWatch

Recursos adicionais poderão ser implementados conforme a evolução do projeto.

### 6.3 Infraestrutura como Código

A infraestrutura será provisionada utilizando Terraform.

O código deverá seguir princípios de:

- Organização
- Reutilização
- Padronização
- Separação por ambiente
- Uso de variáveis
- Uso de outputs
- Versionamento no GitHub

### 6.4 Aplicação D2NS Study Hub

O **D2NS Study Hub** será uma aplicação web simples para gerenciamento de conteúdos de estudo relacionados à Computação em Nuvem.

A aplicação permitirá armazenar e organizar:

- Documentações
- Cursos
- Laboratórios
- Artigos
- Vídeos
- Repositórios
- Links úteis

### 6.5 Containerização

A aplicação será executada utilizando containers Docker.

O ambiente local poderá utilizar Docker Compose para integrar:

- Front-end
- Back-end
- Banco PostgreSQL

### 6.6 DevOps

A evolução do projeto poderá incluir:

- GitHub Actions
- Build automatizado
- Testes automatizados
- Publicação de imagem
- Deploy automatizado
- Controle de versões

### 6.7 Observabilidade

A plataforma deverá possuir mecanismos básicos de observabilidade, incluindo:

- Logs
- Métricas
- Monitoramento de recursos
- Monitoramento da aplicação
- Alertas básicos

---

## 7. Escopo da Primeira Versão

A primeira versão será construída com foco em simplicidade, aprendizado e controle de custos.

### Incluído na primeira versão

- Documentação da arquitetura.
- Infraestrutura provisionada com Terraform.
- Uma VPC.
- Duas zonas de disponibilidade.
- Duas subnets públicas.
- Duas subnets privadas.
- Internet Gateway.
- Route Tables.
- Security Groups.
- Instância EC2.
- Banco Amazon RDS PostgreSQL.
- Acesso administrativo via AWS Systems Manager.
- Aplicação D2NS Study Hub.
- Containerização com Docker.
- Deploy da aplicação.
- Logs básicos com CloudWatch.

### Não incluído inicialmente

- Kubernetes.
- Amazon EKS.
- Arquitetura de microsserviços.
- Autenticação de usuários.
- Múltiplos perfis de acesso.
- Alta disponibilidade completa da aplicação.
- Multi-Region.
- Disaster Recovery avançado.
- WAF.
- CDN.
- Filas e processamento assíncrono.
- Arquitetura Serverless.
- Recursos complexos sem necessidade para o MVP.

Esses itens poderão ser avaliados em versões futuras.

---

## 8. Requisitos Funcionais

A aplicação D2NS Study Hub deverá permitir:

- Cadastrar um conteúdo de estudo.
- Informar o título do conteúdo.
- Informar o link.
- Informar uma categoria.
- Listar os conteúdos cadastrados.
- Abrir o link cadastrado.
- Marcar um conteúdo como importante.
- Remover um conteúdo.
- Remover todos os conteúdos.
- Persistir os registros no PostgreSQL.

---

## 9. Requisitos Não Funcionais

A solução deverá:

- Ser executada em containers Docker.
- Utilizar PostgreSQL como banco de dados.
- Possuir código versionado no GitHub.
- Possuir infraestrutura provisionada com Terraform.
- Seguir boas práticas de segurança.
- Evitar exposição pública desnecessária.
- Possuir documentação atualizada.
- Utilizar padrões de nomenclatura e tags.
- Permitir evolução para múltiplos ambientes.
- Manter o custo controlado durante a fase de desenvolvimento.

---

## 10. Estratégia de Ambientes

A arquitetura será preparada para suportar os ambientes:

```text
dev
hml
prd
```

Inicialmente, apenas o ambiente abaixo será provisionado:

```text
dev
```

Os ambientes `hml` e `prd` permanecerão documentados e preparados para implementação futura.

Essa estratégia evita custos desnecessários durante a fase inicial, sem limitar a evolução da arquitetura.

---

## 11. Premissas

O projeto considera as seguintes premissas:

- Utilização de uma conta AWS destinada a estudos e portfólio.
- Utilização prioritária de recursos de baixo custo.
- Monitoramento constante dos custos da conta AWS.
- Provisionamento inicial apenas do ambiente `dev`.
- Utilização de Terraform para criação da infraestrutura.
- Utilização de GitHub para controle de versão.
- Utilização de Docker para execução da aplicação.
- Desenvolvimento incremental e documentado.
- Aplicação com complexidade semelhante à aplicação BIA utilizada como referência de estudo.

---

## 12. Restrições

- Orçamento limitado.
- Priorização de recursos compatíveis com o Free Tier quando possível.
- Ausência de uma equipe dedicada de desenvolvimento.
- Desenvolvimento da aplicação limitado ao necessário para validar a infraestrutura.
- Implementação gradual.
- Recursos avançados serão adicionados apenas quando agregarem valor técnico ao projeto.
- Evitar componentes que aumentem custos sem necessidade imediata.

---

## 13. Riscos

### Custos inesperados na AWS

**Mitigação:**

- Configurar orçamento e alertas.
- Monitorar recursos ativos.
- Desligar ou remover recursos não utilizados.
- Evitar inicialmente serviços com custo elevado.

### Complexidade excessiva

**Mitigação:**

- Trabalhar com entregas incrementais.
- Priorizar o MVP.
- Evitar overengineering.
- Implementar recursos apenas quando houver justificativa.

### Falhas de segurança

**Mitigação:**

- Aplicar menor privilégio.
- Evitar SSH público.
- Utilizar AWS Systems Manager.
- Restringir comunicação por Security Groups.
- Não armazenar credenciais no repositório.

### Perda de informações ou código

**Mitigação:**

- Utilizar Git e GitHub.
- Criar commits frequentes.
- Documentar cada etapa.
- Manter scripts reproduzíveis.

### Dificuldade no desenvolvimento da aplicação

**Mitigação:**

- Manter a aplicação simples.
- Utilizar como referência apenas o nível de entrega da aplicação BIA.
- Desenvolver um recurso por vez.
- Priorizar o entendimento da integração com a infraestrutura.

---

## 14. Critérios de Sucesso

O projeto será considerado bem-sucedido quando:

- A infraestrutura puder ser provisionada utilizando Terraform.
- A VPC e as subnets estiverem corretamente configuradas.
- A aplicação estiver disponível para acesso.
- O back-end se comunicar com o banco PostgreSQL.
- Os dados permanecerem armazenados no banco.
- A aplicação estiver sendo executada em container Docker.
- O acesso administrativo ocorrer por AWS Systems Manager.
- Os recursos estiverem organizados com nomes e tags padronizados.
- A arquitetura estiver documentada.
- Os custos estiverem monitorados.
- O repositório apresentar uma evolução clara do projeto.
- O projeto puder ser explicado tecnicamente em entrevistas.

---

## 15. Entregáveis

Ao final do projeto, deverão existir os seguintes entregáveis:

- Repositório organizado no GitHub.
- README completo.
- Project Charter.
- Roadmap.
- Documentação da arquitetura.
- Diagramas.
- Código Terraform.
- Scripts auxiliares.
- Aplicação D2NS Study Hub.
- Banco PostgreSQL.
- Arquivos Docker.
- Pipeline de CI/CD, quando implementado.
- Monitoramento básico.
- Documentação de implantação.
- Documentação de operação.
- Registro das lições aprendidas.

---

## 16. Tecnologias Previstas

### Cloud

- Amazon Web Services

### Infraestrutura como Código

- Terraform

### Containers

- Docker
- Docker Compose

### Front-end

- React
- Vite

### Back-end

- Node.js
- Express

### Persistência

- PostgreSQL
- Sequelize

### DevOps

- Git
- GitHub
- GitHub Actions

### Observabilidade

- Amazon CloudWatch

---

## 17. Estrutura de Alto Nível

```text
Internet
    ↓
Aplicação D2NS Study Hub
    ↓
Amazon EC2
    ↓
Docker
    ↓
Node.js / React
    ↓
Amazon RDS PostgreSQL
```

O acesso administrativo será realizado preferencialmente por:

```text
Administrador
    ↓
AWS Systems Manager
    ↓
Amazon EC2
```

Sem necessidade de exposição pública da porta SSH.

---

## 18. Estratégia de Execução

A execução seguirá uma abordagem incremental:

### Etapa 1 — Planejamento

- Definição do projeto.
- Organização do repositório.
- Project Charter.
- Roadmap.
- Arquitetura inicial.

### Etapa 2 — Infraestrutura

- Criação dos arquivos Terraform.
- Provisionamento da rede.
- Provisionamento de segurança.
- Provisionamento de computação e banco.

### Etapa 3 — Aplicação

- Definição da arquitetura da aplicação.
- Criação do banco de dados.
- Desenvolvimento do back-end.
- Desenvolvimento do front-end.
- Testes locais.

### Etapa 4 — Containerização e Deploy

- Criação do Dockerfile.
- Criação do Docker Compose.
- Deploy na infraestrutura AWS.
- Validação da comunicação com o banco.

### Etapa 5 — Automação

- Pipeline de build.
- Pipeline de deploy.
- Versionamento de artefatos.

### Etapa 6 — Operação

- Logs.
- Métricas.
- Alertas.
- Controle de custos.
- Documentação operacional.

---

## 19. Governança do Projeto

O projeto seguirá os seguintes princípios:

- Documentação antes da implementação quando aplicável.
- Uso de Git para controle de versão.
- Commits pequenos e descritivos.
- Padronização de nomes.
- Padronização de tags.
- Separação clara entre infraestrutura e aplicação.
- Revisão de custos antes da adoção de novos serviços.
- Registro das principais decisões arquiteturais.
- Remoção de dados sensíveis antes dos commits.

---

## 20. Aprovação do Projeto

Este documento formaliza o início da D2NS Cloud Platform e estabelece seu objetivo, escopo, premissas, riscos, tecnologias e critérios de sucesso.

A evolução do projeto será registrada no arquivo `ROADMAP.md` e na documentação armazenada no diretório `docs`.

---

## 21. Status Atual

```text
Status: Em desenvolvimento

Etapa atual:
Planejamento e documentação da arquitetura

Próxima etapa:
Provisionamento da infraestrutura utilizando Terraform
```