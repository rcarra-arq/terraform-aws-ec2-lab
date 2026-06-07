# AWS EC2 Terraform Project

## Overview

This project was developed as part of my Cloud Computing and Infrastructure as Code (IaC) learning journey.

The goal was to provision an Amazon EC2 instance on AWS using Terraform, automating infrastructure deployment through code.

## Technologies Used

* AWS EC2
* Terraform
* Linux
* SSH
* Git/GitHub

## Architecture

Terraform → AWS Provider → Amazon EC2

## Resources Created

* 1 Amazon EC2 instance
* Region: us-east-1
* Instance type: t2.micro
* Amazon Linux 2
* Key Pair: vockey

## Project Structure

terraform/
├── main.tf

## How to Run

Initialize Terraform:

terraform init

Review the execution plan:

terraform plan

Create the infrastructure:

terraform apply

Destroy the infrastructure:

terraform destroy

## Learning Outcomes

During this project I practiced:

* Infrastructure as Code (IaC) concepts
* AWS Provider configuration
* EC2 instance provisioning
* Core Terraform commands
* Basic AWS resource management

# Projeto Terraform AWS EC2

## Visão Geral

Este projeto foi desenvolvido como parte dos meus estudos em Computação em Nuvem e Infraestrutura como Código (IaC).

O objetivo foi provisionar uma instância Amazon EC2 na AWS utilizando Terraform, automatizando a criação da infraestrutura por meio de código.

## Tecnologias Utilizadas

* AWS EC2
* Terraform
* Linux
* SSH
* Git/GitHub

## Arquitetura

Terraform → AWS Provider → Amazon EC2

## Recursos Criados

* 1 instância Amazon EC2
* Região: us-east-1
* Tipo de instância: t2.micro
* Amazon Linux 2
* Key Pair: vockey

## Estrutura do Projeto

terraform/
├── main.tf

## Como Executar

Inicializar o Terraform:

terraform init

Visualizar o plano de execução:

terraform plan

Criar a infraestrutura:

terraform apply

Remover a infraestrutura:

terraform destroy

## Aprendizados

Durante este projeto pratiquei:

* Conceitos de Infraestrutura como Código (IaC)
* Configuração do Provider AWS
* Provisionamento de instâncias EC2
* Utilização dos comandos principais do Terraform
* Gerenciamento básico de recursos na AWS
