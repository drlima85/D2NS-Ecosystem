# Sprint 02 — Camada de Computação e Bootstrap

## Status

✅ Concluída

---

## Objetivo

Provisionar uma instância Amazon EC2 utilizando Terraform, aplicando práticas de segurança, automação e padronização.

A instância foi configurada para administração pelo AWS Systems Manager Session Manager, sem exposição da porta SSH e sem utilização de chave privada `.pem`.

Também foi implementado um processo de bootstrap com User Data para instalar e configurar automaticamente os pacotes necessários no primeiro boot.

---

## Arquitetura implementada

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
Subnet pública
   │
   ▼
EC2 Amazon Linux 2023
   ├── Security Group sem regras de entrada
   ├── IAM Instance Profile
   │      └── IAM Role
   │             └── AmazonSSMManagedInstanceCore
   ├── Volume gp3 criptografado
   ├── IMDSv2 obrigatório
   └── User Data
          ├── Atualização do sistema
          ├── Instalação do Git
          ├── Instalação do Docker
          ├── Inicialização do Docker
          └── Configuração do ec2-user
```

---

## Recursos provisionados

### Security Group

Foi criado um Security Group específico para a instância EC2.

Configuração:

- nenhuma regra de entrada;
- comunicação de saída permitida;
- administração realizada pelo Session Manager;
- porta TCP 22 não exposta.

Nome utilizado:

```text
d2ns-cloud-platform-dev-app-sg
```

### IAM Role

Foi criada uma IAM Role que pode ser assumida pelo serviço EC2.

A relação de confiança utiliza:

```text
ec2.amazonaws.com
```

A role recebeu a política gerenciada:

```text
AmazonSSMManagedInstanceCore
```

Essa política permite que o SSM Agent se registre e se comunique com o AWS Systems Manager.

### IAM Instance Profile

Foi criado um Instance Profile para associar a IAM Role à instância EC2.

```text
EC2
└── Instance Profile
       └── IAM Role
              └── AmazonSSMManagedInstanceCore
```

### Instância EC2

Configuração utilizada:

| Item | Configuração |
|---|---|
| Sistema operacional | Amazon Linux 2023 |
| Arquitetura | x86_64 |
| Tipo | t3.micro |
| Subnet | Pública |
| Endereço IP público | Habilitado |
| Acesso administrativo | AWS Systems Manager |
| Key Pair | Não utilizado |
| Volume raiz | gp3 de 8 GB |
| Criptografia | Habilitada |
| Metadata Service | IMDSv2 obrigatório |

Nome utilizado:

```text
d2ns-cloud-platform-dev-app-ec2
```

---

## Consulta dinâmica da AMI

A AMI do Amazon Linux 2023 não foi definida por meio de um ID fixo.

O Terraform consulta dinamicamente a imagem mais recente publicada pela Amazon:

```hcl
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
```

Essa abordagem evita depender de um identificador de AMI específico, que pode variar entre regiões e versões.

---

## Bootstrap automatizado

O script de bootstrap foi mantido separado do arquivo `compute.tf`:

```text
infrastructure/
└── terraform/
    ├── compute.tf
    └── userdata/
        └── bootstrap.sh
```

O Terraform referencia o arquivo com:

```hcl
user_data = file("${path.module}/userdata/bootstrap.sh")
```

Também foi configurado:

```hcl
user_data_replace_on_change = true
```

Com isso, alterações no User Data provocam a substituição da EC2, garantindo que uma nova instância execute o bootstrap no primeiro boot.

---

## Ações executadas pelo User Data

O script executa:

```bash
#!/bin/bash
set -euxo pipefail

dnf update -y
dnf install -y git docker

systemctl enable --now docker
usermod -aG docker ec2-user

cat <<EOF > /var/log/d2ns-bootstrap.log
D2NS Cloud Platform
Bootstrap concluido com sucesso.
Git e Docker instalados.
EOF
```

As ações realizadas são:

- atualização dos pacotes do Amazon Linux;
- instalação do Git;
- instalação do Docker;
- habilitação do Docker nos próximos boots;
- inicialização imediata do serviço Docker;
- inclusão do `ec2-user` no grupo `docker`;
- criação de um arquivo de evidência do bootstrap.

---

## Validações realizadas

### Sistema operacional

```bash
cat /etc/os-release
```

Resultado validado:

```text
NAME="Amazon Linux"
VERSION="2023"
```

### Git

```bash
git --version
```

Resultado validado:

```text
git version 2.50.1
```

### Docker

```bash
docker --version
```

Resultado validado:

```text
Docker version 25.0.14
```

### Serviço Docker

```bash
sudo systemctl is-active docker
```

Resultado:

```text
active
```

### Log do bootstrap

```bash
sudo cat /var/log/d2ns-bootstrap.log
```

Resultado:

```text
D2NS Cloud Platform
Bootstrap concluido com sucesso.
Git e Docker instalados.
```

### Usuário do Session Manager

```bash
whoami
```

Resultado:

```text
ssm-user
```

### Grupo Docker

```bash
id ec2-user
```

A saída confirmou que o usuário pertence ao grupo:

```text
docker
```

---

## Segurança aplicada

As seguintes práticas foram adotadas:

- acesso administrativo sem SSH;
- nenhuma regra de entrada no Security Group;
- ausência de Key Pair;
- autenticação e autorização por IAM;
- IAM Role associada por Instance Profile;
- volume EBS criptografado;
- IMDSv2 obrigatório;
- instalação automatizada e reproduzível;
- separação entre código Terraform e script de bootstrap.

---

## Problema encontrado

O usuário Terraform utilizava inicialmente a política:

```text
PowerUserAccess
```

Durante a criação da IAM Role, ocorreu erro de autorização:

```text
AccessDenied: iam:CreateRole
```

A correção foi criar uma política IAM JSON específica para permitir somente o gerenciamento das roles e Instance Profiles do projeto, evitando a concessão de `AdministratorAccess`.

Essa abordagem manteve o princípio de menor privilégio.

---

## Arquivos adicionados

```text
infrastructure/terraform/
├── compute.tf
├── iam.tf
├── security.tf
└── userdata/
    └── bootstrap.sh
```

---

## Principais aprendizados

- diferença entre Security Group e IAM;
- diferença entre Trust Policy e Permission Policy;
- funcionamento de IAM Role e Instance Profile;
- acesso à EC2 pelo Systems Manager;
- administração sem porta 22 e sem chave SSH;
- consulta dinâmica de AMI;
- criação de EC2 com Terraform;
- uso de User Data e cloud-init;
- bootstrap automatizado;
- substituição da instância quando o User Data muda;
- validação de serviços dentro da EC2;
- aplicação do princípio de menor privilégio.

---

## Resultado da Sprint

A Sprint 2 entregou uma camada de computação segura, automatizada e reproduzível.

A instância EC2 foi provisionada por Terraform, registrada no Systems Manager e preparada automaticamente com Git e Docker, sem necessidade de configuração manual ou exposição de acesso SSH.

---

## Próximos passos

- atualizar o README principal;
- adicionar outputs da camada de computação;
- organizar evidências visuais;
- realizar commit e push;
- iniciar a Sprint 3.