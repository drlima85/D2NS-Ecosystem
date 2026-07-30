# AWS Network Foundation

## Visão Geral

Este documento descreve o planejamento da arquitetura de rede da **D2NS Cloud Platform** na Amazon Web Services (AWS) para a criação de uma aplicação chamada D2NS Study Hub.

O objetivo é definir uma arquitetura segura, escalável e organizada antes da implementação da infraestrutura, seguindo boas práticas de Cloud Computing e Infrastructure as Code (IaC).

A arquitetura será projetada com foco em:

- Segurança
- Escalabilidade
- Alta disponibilidade
- Organização
- Controle de custos
- Automação com Terraform

---

## Região AWS

A região inicial escolhida para o projeto é:

- **Região:** US East (N. Virginia)
- **Código:** `us-east-1`

### Justificativa

A região **us-east-1** foi selecionada pelos seguintes motivos:

- Grande disponibilidade de serviços AWS.
- Ampla compatibilidade com laboratórios e documentações.
- Custos geralmente competitivos.
- Disponibilidade de múltiplas Availability Zones.
- Facilidade para estudos, testes e futuras implementações.

> **Observação:** Em um cenário de produção voltado ao mercado brasileiro, uma alternativa seria utilizar a região **South America (São Paulo)** (`sa-east-1`), considerando requisitos de latência, residência de dados e conformidade.

---

## Estratégia de Ambientes

A D2NS Cloud Platform será projetada para suportar múltiplos ambientes, permitindo que a infraestrutura evolua de forma organizada e escalável.

Inicialmente, o projeto será desenvolvido utilizando apenas o ambiente:

- **dev** (Desenvolvimento)

À medida que a plataforma evoluir, poderão ser adicionados novos ambientes:

| Ambiente | Descrição |
|----------|-----------|
| **dev** | Desenvolvimento e testes |
| **hml** | Homologação para validações |
| **prd** | Ambiente de produção |

Essa separação facilita a organização dos recursos, reduz riscos durante alterações e segue boas práticas adotadas em projetos corporativos.

---

## Padrão de Nomenclatura (Taxonomia)

Os recursos da **D2NS Cloud Platform** seguirão um padrão de nomenclatura consistente para facilitar a identificação, organização e manutenção da infraestrutura ao longo do ciclo de vida do projeto.

### Padrão

```text
<projeto>-<ambiente>-<categoria-do-recurso>-<identificador>
```

### Exemplo

```text
d2ns-dev-vpc-main
```

### Convenções

- Utilizar letras minúsculas.
- Separar palavras com hífen (`-`).
- Evitar espaços e caracteres especiais.
- Identificar claramente o ambiente (`dev`, `hml` ou `prd`).
- Utilizar nomes curtos, descritivos e padronizados.

---

## Estratégia de Tags

Além do padrão de nomenclatura, todos os recursos deverão possuir um conjunto mínimo de tags para facilitar a organização, rastreabilidade, governança e futuras análises de custo.

### Tags obrigatórias

| Chave       | Exemplo             | Descrição |
|-------------|---------------------|-----------|
| Project     | D2NS Cloud Platform | Projeto ao qual o recurso pertence |
| Environment | dev                 | Ambiente do recurso |
| Owner       | Danilo Lima         | Responsável pelo recurso |
| ManagedBy   | Terraform           | Ferramenta responsável pelo provisionamento |
| Repository  | github.com/danilo   | Repositório da infraestrutura |

### Exemplo

```text
Project     = D2NS Cloud Platform
Environment = dev
Owner       = Danilo Lima
ManagedBy   = Terraform
Repository  = github.com/danilo...
```

A utilização de tags padronizadas facilita a gestão dos recursos, melhora a rastreabilidade da infraestrutura e prepara o ambiente para futuras práticas de governança e FinOps.

---

## Planejamento de Rede (CIDR)

A D2NS Cloud Platform utilizará uma VPC dedicada para cada ambiente, garantindo isolamento lógico entre desenvolvimento, homologação e produção.

Foi escolhido o bloco CIDR `10.0.0.0/16` como padrão para os ambientes, permitindo ampla capacidade de expansão para novas sub-redes e serviços.

### Padrão de Rede

| Item | Valor |
|------|-------|
| CIDR Base | 10.0.0.0/16 |
| Máscara | /16 |
| Total de Endereços | 65.536 |

### Objetivos

- Isolar os recursos da plataforma.
- Facilitar a segmentação entre sub-redes públicas e privadas.
- Permitir expansão da infraestrutura sem necessidade de reestruturação da rede.
- Seguir as boas práticas recomendadas pela AWS para arquiteturas escaláveis.

> **Observação:** Nesta primeira fase do projeto, apenas o ambiente **dev** será implementado. Os ambientes **hml** e **prd** fazem parte do planejamento da arquitetura e serão provisionados em etapas futuras.


---

## Availability Zones e Subnets

A arquitetura da D2NS Cloud Platform será distribuída entre duas Availability Zones da região `us-east-1`.

Essa distribuição permite maior disponibilidade dos serviços e reduz o impacto de falhas isoladas em uma única zona.

### Availability Zones

| Zona | Utilização |
|------|------------|
| us-east-1a | Subnets públicas e privadas |
| us-east-1b | Subnets públicas e privadas |

### Estrutura de Subnets

| Subnet | Availability Zone | Tipo | CIDR |
|--------|-------------------|------|------|
| d2ns-dev-subnet-public-a | us-east-1a | Pública | 10.0.1.0/24 |
| d2ns-dev-subnet-public-b | us-east-1b | Pública | 10.0.2.0/24 |
| d2ns-dev-subnet-private-a | us-east-1a | Privada | 10.0.10.0/24 |
| d2ns-dev-subnet-private-b | us-east-1b | Privada | 10.0.20.0/24 |

### Distribuição da Arquitetura

As subnets públicas serão utilizadas para recursos que necessitam de comunicação direta com a internet, como:

- Application Load Balancer
- NAT Gateway
- Recursos temporários de administração, quando necessário

As subnets privadas serão utilizadas para recursos internos da plataforma, como:

- Instâncias EC2 da aplicação
- Banco de dados RDS
- Serviços que não devem possuir exposição direta à internet

Essa divisão melhora a segurança da arquitetura, reduz a superfície de exposição e prepara o ambiente para futuras implementações de alta disponibilidade.

---

## Internet Gateway (IGW)

A VPC possuirá um Internet Gateway (IGW) para permitir que recursos localizados em subnets públicas tenham acesso à Internet.

O Internet Gateway será associado à VPC principal e utilizado pelas tabelas de rotas das subnets públicas.

### Objetivos

- Permitir acesso à Internet para recursos públicos.
- Possibilitar acesso aos repositórios de pacotes e atualizações.
- Suportar futuras implementações de Load Balancer.

---

## Route Tables

A arquitetura utilizará tabelas de rotas distintas para subnets públicas e privadas.

### Route Table Pública

Responsável por direcionar o tráfego destinado à Internet através do Internet Gateway.

| Destino | Target |
|----------|--------|
| 10.0.0.0/16 | Local |
| 0.0.0.0/0 | Internet Gateway |

### Route Table Privada

Inicialmente, as subnets privadas possuirão apenas comunicação interna dentro da VPC.

| Destino | Target |
|----------|--------|
| 10.0.0.0/16 | Local |

Essa estratégia reduz a exposição dos recursos internos e segue o princípio de menor privilégio.

---

## NAT Gateway

Nesta primeira fase do projeto não será utilizado NAT Gateway.

Como o objetivo é utilizar o AWS Free Tier e reduzir custos durante o desenvolvimento da plataforma, os recursos privados que necessitarem acesso temporário à Internet utilizarão alternativas controladas, como AWS Systems Manager (SSM).

O NAT Gateway poderá ser incorporado em versões futuras da arquitetura para suportar ambientes de homologação e produção.

---

## Security Groups

A comunicação entre os serviços será controlada por Security Groups específicos para cada camada da arquitetura.

Inicialmente serão utilizados grupos de segurança para:

- Load Balancer
- Aplicação
- Banco de Dados
- Administração (quando necessário)

O acesso entre os recursos será permitido apenas quando estritamente necessário, seguindo o princípio do menor privilégio.

---

## Network ACLs

Nesta primeira versão da arquitetura serão utilizadas as Network ACLs padrão da VPC.

Como os Security Groups já fornecem controle de acesso suficiente para os objetivos do projeto, não será realizada customização das ACLs neste momento.

Caso o projeto evolua para cenários mais complexos, poderão ser implementadas regras específicas de Network ACL para reforçar a segurança da rede.

---

## Fluxo da Arquitetura

A comunicação entre os principais componentes seguirá o fluxo abaixo:

```text
Internet
    │
    ▼
Application Load Balancer
    │
    ▼
EC2 (Aplicação)
    │
    ▼
Amazon RDS PostgreSQL
```

Os recursos de banco de dados permanecerão em subnets privadas, sem exposição direta à Internet.

O acesso administrativo será realizado utilizando AWS Systems Manager (Session Manager), eliminando a necessidade de acesso SSH público.

---

## Boas Práticas Adotadas

Durante o planejamento da arquitetura foram consideradas as seguintes boas práticas:

- Separação entre subnets públicas e privadas.
- Utilização de múltiplas Availability Zones.
- Padronização da nomenclatura dos recursos.
- Padronização de tags.
- Controle de acesso utilizando Security Groups.
- Isolamento da rede por ambiente.
- Preparação para automação com Terraform.
- Arquitetura preparada para expansão futura.
- Otimização de custos utilizando recursos compatíveis com o AWS Free Tier.

---

## Próximos Passos

Após a definição da arquitetura de rede, as próximas etapas do projeto serão:

1. Provisionamento da VPC utilizando Terraform.
2. Criação das subnets públicas e privadas.
3. Configuração das tabelas de rotas.
4. Implementação dos Security Groups.
5. Provisionamento dos recursos da aplicação.
6. Documentação da infraestrutura como código (IaC).
