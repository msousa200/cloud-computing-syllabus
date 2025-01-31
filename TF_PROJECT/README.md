# Projeto Terraform: Cluster Kubernetes Multi-Cliente com Implantação do Odoo

## Visão Geral

Este projeto implanta um cluster Kubernetes usando **Minikube** e gerencia múltiplos clientes (Netflix, Meta, Rockstar) com criação dinâmica de namespaces. Ele inclui a implantação da aplicação **Odoo**, um banco de dados **PostgreSQL** e acesso seguro **HTTPS** via Ingress. A infraestrutura é gerenciada usando **Terraform**, garantindo flexibilidade e escalabilidade.

---

## Pré-requisitos

Antes de começar, certifique-se de ter as seguintes ferramentas instaladas:

- **Terraform**: [Instalar Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- **kubectl**: [Instalar kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- **Minikube**: [Instalar Minikube](https://minikube.sigs.k8s.io/docs/start/)

---

## Implantação Passo a Passo

### 1. Iniciar o Minikube

Inicie um cluster Kubernetes local usando o Minikube:

```bash
minikube start

2. Inicializar o Terraform

Navegue até o diretório do projeto e inicialize o Terraform:
bash
Copy

terraform init

3. Criar um Workspace para um Cliente

Crie e selecione um workspace para o cliente (por exemplo, Netflix):
bash
Copy

terraform workspace new netflix
terraform workspace select netflix

4. Aplicar a Configuração

Aplique a configuração do Terraform para o cliente selecionado:
bash
Copy

terraform plan -var-file=environments/netflix.tfvars
terraform apply -var-file=environments/netflix.tfvars

5. Verificar a Implantação

Verifique o status dos recursos Kubernetes:
bash
Copy

kubectl get pods -n netflix-prod
kubectl get services -n netflix-prod
kubectl get ingress -n netflix-prod

6. Acessar a Aplicação Odoo

Acesse a aplicação Odoo via URL do Ingress:
Copy

https://netflix.example.com

7. Repetir para Outros Clientes

Repita o processo para outros clientes (Meta, Rockstar) selecionando o workspace e o arquivo .tfvars apropriados.
