![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-black)

# AWS EC2 Terraform Project

**🇺🇸 English** · [🇧🇷 Português](#português)

## Overview

This project started from a simple curiosity: instead of building everything by
clicking through the AWS console in the lab, what would it be like to do it in
code? So I built a first, deliberately minimal version — just to understand the
process of working with Infrastructure as Code (IaC), a topic I'm genuinely
interested in learning.

## The evolution — from hardcoded to reusable

Revisiting it a few months later, I realized it wasn't just simple — it wasn't
reusable at all. It was hardcoded, frozen in time. So I refactored it with
variables to turn it into something that can actually be reused. Here's what
changed and why:

| Before | After | Why |
|---|---|---|
| Everything hardcoded in `main.tf` (region, AMI, type, key, name) | 6 input variables in `variables.tf` | Change the values in one place — the code becomes reusable |
| No firewall — couldn't connect over SSH without setting it up by hand afterwards | A dedicated security group opening port 22, with a configurable CIDR | Access control, designed with security in mind |
| No outputs — had to hunt for the public IP in the AWS console | `outputs.tf` prints the public IP and a ready-to-use SSH command | Terraform hands me everything at the end |
| A single file | Three files split by responsibility (`variables.tf` · `main.tf` · `outputs.tf`) | Organization — each thing in its place |

## Project structure

```text
terraform-aws-ec2-lab/
├── variables.tf   # inputs: region, AMI, instance type, key, name, allowed SSH CIDR
├── main.tf        # resources: security group + EC2 instance
├── outputs.tf     # outputs: instance ID, public IP, ready-to-use SSH command
└── README.md
```

## A note on security

I made the SSH CIDR configurable because this is a dynamic setup — it lets the
code be reused in different ways. I keep it as `/32` on my own IP, which
restricts access to a single machine (mine), so it works as my personal lab.
From there I can adjust it as needed, following the principle of least
privilege. `0.0.0.0/0` opens SSH to the whole internet and is only acceptable
for a short-lived lab.

## How to run

```bash
terraform init      # initialize Terraform and download the AWS provider
terraform plan      # review the execution plan
terraform apply     # create the infrastructure
terraform destroy   # remove the infrastructure (important for cost control)
```

After `apply`, Terraform prints the public IP and a ready-to-use SSH command
from `outputs.tf` (Amazon Linux uses the `ec2-user` login).

## What I learned

I took variables — a concept I first learned in my Python classes — and used
them here for something really important: making code reusable. Going from a
fixed, one-off script to a parametrized, reusable setup was the real lesson of
this refactor.

*Renata C. — Cloud Computing career transition focused on AWS, Infrastructure,
and DevOps practices.*

---

## Português

[🇺🇸 English ⬆](#aws-ec2-terraform-project)

### Visão Geral

Este projeto nasceu de uma curiosidade simples: em vez de criar toda a estrutura
clicando na plataforma da AWS no laboratório, como seria fazer isso por código?
Então fiz uma primeira versão bem simples, só para entender o processo de usar
Infraestrutura como Código (IaC) — um assunto que me interessa aprender.

### A evolução — de código fixo a reutilizável

Revisitando o projeto alguns meses depois, vi que ele não era só simples: não
era reutilizável para nada — era um código fixo, preso no tempo. Então resolvi
usar variáveis e transformá-lo em algo que possa ser aproveitado. O que mudou e
por quê:

| Antes | Depois | Por quê |
|---|---|---|
| Tudo cravado no `main.tf` (região, AMI, tipo, key, nome) | 6 variáveis de entrada em `variables.tf` | Mudo os valores num lugar só — o código vira reutilizável |
| Sem firewall — não dava pra conectar por SSH sem configurar na mão depois | Um security group dedicado abrindo a porta 22, com CIDR configurável | Controle de acesso, pensado com segurança |
| Sem outputs — precisava caçar o IP público no console | `outputs.tf` imprime o IP público e o comando SSH pronto | O Terraform já me entrega tudo no final |
| Um arquivo só | Três arquivos separados por responsabilidade (`variables.tf` · `main.tf` · `outputs.tf`) | Organização — cada coisa no seu lugar |

### Estrutura do projeto

```text
terraform-aws-ec2-lab/
├── variables.tf   # entradas: região, AMI, tipo, key, nome, CIDR liberado para SSH
├── main.tf        # recursos: security group + instância EC2
├── outputs.tf     # saídas: ID da instância, IP público, comando SSH pronto
└── README.md
```

### Uma nota sobre segurança

Deixei o CIDR do SSH configurável porque essa é uma estrutura dinâmica — permite
que o código seja reutilizado de várias maneiras. Eu mantenho `/32` no meu
próprio IP, o que restringe o acesso a uma única máquina (a minha), então
funciona como meu laboratório pessoal. A partir daí posso ajustar conforme a
necessidade, seguindo o conceito de menor privilégio. O `0.0.0.0/0` abre o SSH
para a internet inteira e só é aceitável para um lab de curta duração.

### Como executar

```bash
terraform init      # inicializa o Terraform e baixa o provider da AWS
terraform plan      # visualiza o plano de execução
terraform apply     # cria a infraestrutura
terraform destroy   # remove a infraestrutura (importante para controle de custos)
```

Após o `apply`, o Terraform imprime o IP público e um comando SSH pronto (o
`outputs.tf`). No Amazon Linux, o usuário de login é `ec2-user`.

### O que eu aprendi

Peguei variáveis — um conceito que aprendi nas minhas aulas de Python — e usei
aqui para algo muito importante: deixar o código reutilizável. Sair de um script
fixo, de uso único, para uma estrutura parametrizada e reaproveitável foi o
verdadeiro aprendizado dessa refatoração.

*Renata C. — Profissional em transição de carreira para Cloud Computing, com
foco em AWS, Infraestrutura e práticas de DevOps.*
