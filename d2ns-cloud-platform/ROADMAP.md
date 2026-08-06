# ROADMAP — D2NS Cloud Platform

## Visão Geral

Este roadmap apresenta a evolução planejada da **D2NS Cloud Platform**, desde a estrutura inicial até a implementação da infraestrutura, aplicação, automação, observabilidade e otimização de custos.

A execução segue uma abordagem incremental, com cada etapa implementada, validada, documentada e versionada antes do início da próxima.

---

## Status Atual

**Projeto:** Em desenvolvimento  
**Fase atual:** Infraestrutura AWS  
**Última entrega:** Sprint 02 — Computação e Bootstrap  
**Próxima etapa:** Sprint 03 — Camada de Dados

---

## Progresso das Sprints

| Sprint | Entrega | Status |
|---|---|---|
| Sprint 00 | Planejamento e estrutura inicial | ✅ Concluída |
| Sprint 01 | Rede AWS e infraestrutura base | ✅ Concluída |
| Sprint 02 | Computação segura e bootstrap automatizado | ✅ Concluída |
| Sprint 03 | Camada de dados com PostgreSQL | ⏳ Próxima |
| Sprint 04 | Desenvolvimento da aplicação | ⬜ Planejada |
| Sprint 05 | Containerização da aplicação | ⬜ Planejada |
| Sprint 06 | Deploy da aplicação na AWS | ⬜ Planejada |
| Sprint 07 | CI/CD | ⬜ Planejada |
| Sprint 08 | Observabilidade | ⬜ Planejada |
| Sprint 09 | FinOps e otimização | ⬜ Planejada |

---

# Sprint 00 — Planejamento

## Objetivo

Definir a base organizacional e documental do projeto.

### Entregas

- [x] Estrutura do repositório
- [x] README inicial
- [x] Project Charter
- [x] Roadmap
- [x] Licença
- [x] `.gitignore`
- [x] Organização dos diretórios
- [x] Estratégia de evolução por sprints

**Status:** ✅ Concluída

---

# Sprint 01 — Rede AWS

## Objetivo

Provisionar a infraestrutura base de rede utilizando Terraform.

### Entregas

- [x] Provider AWS
- [x] Padronização de nomes e tags
- [x] VPC dedicada
- [x] Internet Gateway
- [x] Subnet pública
- [x] Subnet privada
- [x] Route Table pública
- [x] Rota `0.0.0.0/0` para o Internet Gateway
- [x] Associação da subnet pública
- [x] Outputs da infraestrutura
- [x] Validação no Terraform e na AWS
- [x] Documentação da sprint

**Status:** ✅ Concluída

---

# Sprint 02 — Computação e Bootstrap

## Objetivo

Provisionar uma camada de computação segura e automatizada.

### Entregas

- [x] Security Group da aplicação
- [x] IAM Role para EC2
- [x] Política `AmazonSSMManagedInstanceCore`
- [x] IAM Instance Profile
- [x] Consulta dinâmica da AMI Amazon Linux 2023
- [x] Instância EC2
- [x] Volume EBS `gp3` criptografado
- [x] IMDSv2 obrigatório
- [x] Administração pelo AWS Systems Manager
- [x] Ausência de SSH e Key Pair
- [x] User Data
- [x] Bootstrap automatizado
- [x] Instalação do Git
- [x] Instalação e inicialização do Docker
- [x] Validação pelo Session Manager
- [x] Documentação da sprint

**Status:** ✅ Concluída

---

# Sprint 03 — Camada de Dados

## Objetivo

Provisionar uma camada de dados privada e permitir comunicação controlada entre aplicação e banco.

### Entregas planejadas

- [ ] Definir estratégia de credenciais
- [ ] Criar Security Group do banco
- [ ] Permitir PostgreSQL somente a partir do Security Group da aplicação
- [ ] Criar subnets adicionais, caso necessárias para o RDS
- [ ] Criar DB Subnet Group
- [ ] Provisionar Amazon RDS PostgreSQL
- [ ] Desabilitar acesso público ao banco
- [ ] Configurar criptografia
- [ ] Definir backup e retenção adequados ao laboratório
- [ ] Criar outputs não sensíveis
- [ ] Testar conectividade EC2 → RDS
- [ ] Documentar e validar a sprint

**Status:** ⏳ Próxima

> A implementação do RDS poderá exigir uma segunda subnet privada em outra Zona de Disponibilidade para composição do DB Subnet Group.

---

# Sprint 04 — D2NS Study Hub

## Objetivo

Desenvolver a aplicação utilizada para validar a plataforma.

### Front-end

- [ ] React
- [ ] Vite

### Back-end

- [ ] Node.js
- [ ] Express
- [ ] Sequelize

### Funcionalidades iniciais

- [ ] Cadastro de conteúdos
- [ ] Listagem de conteúdos
- [ ] Exclusão de conteúdos
- [ ] Marcação de itens importantes
- [ ] Integração com PostgreSQL

**Status:** ⬜ Planejada

---

# Sprint 05 — Containerização

## Objetivo

Containerizar os componentes da aplicação.

### Entregas planejadas

- [ ] Dockerfile do front-end
- [ ] Dockerfile do back-end
- [ ] Docker Compose para ambiente local
- [ ] Variáveis de ambiente
- [ ] Health checks
- [ ] Testes dos containers

**Status:** ⬜ Planejada

> O Docker já foi instalado automaticamente na EC2 durante a Sprint 02. Esta sprint trata da containerização da aplicação.

---

# Sprint 06 — Deploy AWS

## Objetivo

Executar a aplicação utilizando a infraestrutura provisionada.

### Entregas planejadas

- [ ] Estratégia de deploy
- [ ] Publicação dos artefatos ou imagens
- [ ] Deploy da aplicação
- [ ] Comunicação com PostgreSQL
- [ ] Testes funcionais
- [ ] Validação ponta a ponta

**Status:** ⬜ Planejada

---

# Sprint 07 — DevOps e CI/CD

## Objetivo

Automatizar validação, build e deploy.

### Entregas planejadas

- [ ] GitHub Actions
- [ ] `terraform fmt -check`
- [ ] `terraform validate`
- [ ] Build automatizado
- [ ] Testes automatizados
- [ ] Deploy automatizado

**Status:** ⬜ Planejada

---

# Sprint 08 — Observabilidade

## Objetivo

Monitorar a infraestrutura e a aplicação.

### Entregas planejadas

- [ ] Amazon CloudWatch
- [ ] Centralização de logs
- [ ] Métricas
- [ ] Alarmes
- [ ] Dashboard básico
- [ ] Documentação operacional

**Status:** ⬜ Planejada

---

# Sprint 09 — FinOps

## Objetivo

Avaliar custos e aplicar práticas de otimização.

### Entregas planejadas

- [ ] Revisão dos recursos provisionados
- [ ] Estimativa de custos
- [ ] Identificação de recursos ociosos
- [ ] Tags para alocação de custos
- [ ] Estratégias de desligamento e limpeza
- [ ] Recomendações de otimização

**Status:** ⬜ Planejada

---

# Documentação Visual

### Entregas

- [ ] Diagrama da arquitetura atual no Draw.io
- [ ] Arquivo editável `.drawio`
- [ ] Exportação em SVG para o GitHub
- [ ] Exportação em PNG para apresentações e LinkedIn
- [ ] Atualização progressiva do diagrama

**Status:** 🟡 Em andamento

---

# Evoluções Futuras

## Infraestrutura

- Auto Scaling
- Application Load Balancer
- Amazon ECS
- NAT Gateway, quando necessário
- AWS Backup
- Route 53
- HTTPS com AWS Certificate Manager

## Segurança

- AWS Secrets Manager
- AWS KMS
- AWS WAF
- VPC Endpoints
- análise de vulnerabilidades
- políticas IAM mais granulares

## Aplicação

- autenticação
- usuários
- dashboard
- pesquisa
- filtros
- favoritos

## DevOps

- pipeline completo
- versionamento automático
- análise de código
- testes de infraestrutura

## Observabilidade

- dashboards avançados
- alertas operacionais
- rastreamento de aplicação

---

# Critérios de Conclusão

O projeto será considerado concluído quando:

- toda a infraestrutura puder ser provisionada pelo Terraform;
- a aplicação D2NS Study Hub estiver executando na AWS;
- o PostgreSQL estiver integrado de forma segura;
- a aplicação estiver containerizada;
- o deploy estiver automatizado;
- a solução possuir monitoramento básico;
- os custos e recursos forem revisados;
- a documentação técnica e visual estiver concluída;
- o projeto puder ser apresentado como portfólio técnico completo.