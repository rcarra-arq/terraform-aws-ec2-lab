![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-black)

# AWS EC2 Terraform Project

Este projeto nasceu de uma curiosidade simples: em vez de criar toda a estrutura
clicando na plataforma da AWS no laboratório, como seria fazer isso por código?
Então fiz uma primeira versão bem simples, só para entender o processo de usar
Infraestrutura como Código (IaC), um assunto que me interessa aprender.

This project started from a simple curiosity: instead of building everything by
clicking through the AWS console, what would it be like to do it in code? I built
a first, deliberately minimal version, then refactored it to be reusable and
secure.

🇺🇸 [Full version in English ↓](#english)

## Português

## A evolução: de código fixo a reutilizável

Revisitando o projeto alguns meses depois, vi que ele não era só simples: não
era reutilizável para nada, era um código fixo, preso no tempo. Então resolvi
usar variáveis e transformá-lo em algo que possa ser aproveitado. O que mudou e
por quê:

| Antes | Depois | Por quê |
|---|---|---|
| Tudo cravado no `main.tf` (região, AMI, tipo, key, nome) | 6 variáveis de entrada em `variables.tf` | Mudo os valores num lugar só; o código vira reutilizável |
| Sem firewall, não dava pra conectar por SSH sem configurar na mão depois | Um security group dedicado abrindo a porta 22 para um único IP (`/32`), com o CIDR configurável | Controle de acesso seguindo o menor privilégio, só a minha máquina alcança o SSH |
| Sem outputs, precisava caçar o IP público no console | `outputs.tf` imprime o IP público e o comando SSH pronto | O Terraform já me entrega tudo no final |
| Um arquivo só | Três arquivos separados por responsabilidade (`variables.tf` · `main.tf` · `outputs.tf`) | Organização: cada coisa no seu lugar |

## Estrutura do projeto

```text
terraform-aws-ec2-lab/
├── variables.tf              # entradas: região, AMI, tipo, key, nome, CIDR liberado para SSH
├── main.tf                   # recursos: security group + instância EC2
├── outputs.tf                # saídas: ID da instância, IP público, comando SSH pronto
├── terraform.tfvars.example  # modelo dos valores locais (o arquivo real fica no gitignore)
└── README.md
```

## Uma nota sobre segurança

O SSH aqui é acesso de administração: só eu preciso dele. Então o valor certo
para o CIDR é o meu próprio IP com `/32`, que significa "exatamente este
endereço, mais nenhum". É o princípio do menor privilégio aplicado a uma
regra de firewall.

O default no `variables.tf` é `203.0.113.10/32`, um endereço da faixa que a
RFC 5737 reserva para documentação e que não pertence a ninguém. Isso é
proposital: se alguém rodar `terraform apply` sem configurar nada, o security
group criado não deixa *ninguém* entrar, em vez de deixar entrar *todo mundo*.
Prefiro que ele falhe fechado. O `0.0.0.0/0` abriria o SSH para a internet
inteira, e isso não se justifica quando uma única máquina precisa do acesso.

Meu IP real nunca entra no repositório: ele fica num `terraform.tfvars` local,
bloqueado pelo `.gitignore`. O `terraform.tfvars.example`, esse sim versionado,
mostra apenas o formato.

## Como executar

```bash
curl -s https://checkip.amazonaws.com          # descubro meu IP público atual
cp terraform.tfvars.example terraform.tfvars   # e coloco esse IP + /32 no arquivo

terraform init      # inicializa o Terraform e baixa o provider da AWS
terraform plan      # visualiza o plano de execução
terraform apply     # cria a infraestrutura
terraform destroy   # remove a infraestrutura (importante para controle de custos)
```

Após o `apply`, o Terraform imprime o IP público e um comando SSH pronto (o
`outputs.tf`). No Amazon Linux, o usuário de login é `ec2-user`.

## O que eu aprendi

Peguei variáveis, um conceito que aprendi nas minhas aulas de Python, e usei
aqui para algo muito importante: deixar o código reutilizável. Sair de um script
fixo, de uso único, para uma estrutura parametrizada e reaproveitável foi o
verdadeiro aprendizado dessa refatoração.

*Renata C., Profissional em transição de carreira para Cloud Computing, com
foco em AWS, Infraestrutura e práticas de DevOps.*

---

## English

🇧🇷 [Versão em português ↑](#aws-ec2-terraform-project)

## The evolution: from hardcoded to reusable

Revisiting it a few months later, I realized it wasn't just simple, it wasn't
reusable at all. It was hardcoded, frozen in time. So I refactored it with
variables to turn it into something that can actually be reused. Here's what
changed and why:

| Before | After | Why |
|---|---|---|
| Everything hardcoded in `main.tf` (region, AMI, type, key, name) | 6 input variables in `variables.tf` | Change the values in one place; the code becomes reusable |
| No firewall, couldn't connect over SSH without setting it up by hand afterwards | A dedicated security group opening port 22 to a single IP (`/32`), with the CIDR configurable | Access control following least privilege, only my own machine can reach SSH |
| No outputs, had to hunt for the public IP in the AWS console | `outputs.tf` prints the public IP and a ready-to-use SSH command | Terraform hands me everything at the end |
| A single file | Three files split by responsibility (`variables.tf` · `main.tf` · `outputs.tf`) | Organization: each thing in its place |

## Project structure

```text
terraform-aws-ec2-lab/
├── variables.tf              # inputs: region, AMI, instance type, key, name, allowed SSH CIDR
├── main.tf                   # resources: security group + EC2 instance
├── outputs.tf                # outputs: instance ID, public IP, ready-to-use SSH command
├── terraform.tfvars.example  # template for local values (the real file is gitignored)
└── README.md
```

## A note on security

SSH here is admin access: I'm the only one who needs it. So the right value for
the CIDR is my own IP with `/32`, which means "this exact address and no
other". That is least privilege applied to a firewall rule.

The default in `variables.tf` is `203.0.113.10/32`, an address from the range
RFC 5737 reserves for documentation, which belongs to nobody. That is
deliberate: if someone runs `terraform apply` without configuring anything, the
resulting security group lets *no one* in rather than letting *everyone* in. I'd
rather it fail closed. `0.0.0.0/0` would open SSH to the whole internet, and
that isn't justifiable when a single machine needs the access.

My real IP never enters the repository: it lives in a local `terraform.tfvars`
blocked by `.gitignore`. The committed `terraform.tfvars.example` shows only the
format.

## How to run

```bash
curl -s https://checkip.amazonaws.com          # find my current public IP
cp terraform.tfvars.example terraform.tfvars   # then put that IP + /32 in the file

terraform init      # initialize Terraform and download the AWS provider
terraform plan      # review the execution plan
terraform apply     # create the infrastructure
terraform destroy   # remove the infrastructure (important for cost control)
```

After `apply`, Terraform prints the public IP and a ready-to-use SSH command
from `outputs.tf` (Amazon Linux uses the `ec2-user` login).

## What I learned

I took variables, a concept I first learned in my Python classes, and used
them here for something really important: making code reusable. Going from a
fixed, one-off script to a parametrized, reusable setup was the real lesson of
this refactor.

*Renata C., Cloud Computing career transition focused on AWS, Infrastructure,
and DevOps practices.*
