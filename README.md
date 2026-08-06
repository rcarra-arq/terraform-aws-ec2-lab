![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-black)

# AWS EC2 Terraform Project

**🇺🇸 English** · [🇧🇷 Português](#português)

## Overview

This project was developed as part of my Cloud Computing and Infrastructure as
Code (IaC) learning journey. The goal was to provision an Amazon EC2 instance on
AWS using Terraform, automating infrastructure deployment through code.

## Technologies Used

- AWS EC2
- Terraform
- Linux
- SSH
- Git / GitHub

## Architecture

```
Terraform → AWS Provider → Amazon EC2
```

## Resources Created

- 1 Amazon EC2 instance
- Region: us-east-1
- Instance type: t2.micro
- Amazon Linux 2
- Key Pair: vockey

## Project Structure

```text
terraform-aws-ec2-lab/
├── main.tf
├── .terraform.lock.hcl
└── README.md
```

## How to Run

```bash
terraform init      # initialize Terraform and download the AWS provider
terraform plan      # review the execution plan
terraform apply     # create the infrastructure
terraform destroy   # remove the infrastructure (important for cost control)
```

## Learning Outcomes

During this project I practiced:

- Infrastructure as Code (IaC) concepts
- AWS Provider configuration
- EC2 instance provisioning
- Core Terraform commands
- Basic AWS resource management

---

## Português

[🇺🇸 English ⬆](#aws-ec2-terraform-project)

### Visão Geral

Este projeto foi desenvolvido como parte dos meus estudos em Computação em Nuvem
e Infraestrutura como Código (IaC). O objetivo foi provisionar uma instância
Amazon EC2 na AWS utilizando Terraform, automatizando a criação da
infraestrutura por meio de código.

### Tecnologias Utilizadas

- AWS EC2
- Terraform
- Linux
- SSH
- Git / GitHub

### Arquitetura

```
Terraform → AWS Provider → Amazon EC2
```

### Recursos Criados

- 1 instância Amazon EC2
- Região: us-east-1
- Tipo de instância: t2.micro
- Amazon Linux 2
- Key Pair: vockey

### Estrutura do Projeto

```text
terraform-aws-ec2-lab/
├── main.tf
├── .terraform.lock.hcl
└── README.md
```

### Como Executar

```bash
terraform init      # inicializa o Terraform e baixa o provider da AWS
terraform plan      # visualiza o plano de execução
terraform apply     # cria a infraestrutura
terraform destroy   # remove a infraestrutura (importante para controle de custos)
```

### Aprendizados

Durante este projeto pratiquei:

- Conceitos de Infraestrutura como Código (IaC)
- Configuração do Provider AWS
- Provisionamento de instâncias EC2
- Utilização dos comandos principais do Terraform
- Gerenciamento básico de recursos na AWS
