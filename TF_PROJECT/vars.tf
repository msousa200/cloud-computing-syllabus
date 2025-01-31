variable "client_name" {
  description = "Nome do cliente para o qual o ambiente está sendo provisionado"
  type        = string

}

variable "environment" {
  description = "Ambiente onde o Pod será criado (dev, qa, prod)"
  type    = string
  default = "dev"
}

variable "domain" {
  description = "Domínio do cliente para o Ingress"
  type        = string
}

variable "namespace" {
  description = "Nome do namespace a ser criado"
  type = string
}

variable "replicas" {
  description = "Quantidade de réplicas para o Odoo"
  type        = number
  default     = 2
}

variable "postgres_user" {
  description = "Usuário do PostgreSQL"
  type        = string
}

variable "postgres_password" {
  description = "Senha do PostgreSQL"
  type        = string
}

variable "postgres_db" {
  description = "Nome do banco de dados do PostgreSQL"
  type        = string
}

