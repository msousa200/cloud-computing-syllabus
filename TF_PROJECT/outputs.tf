output "odoo_url" {
  description = "URL do Odoo"
  value       = "http://${var.domain}"
}

output "postgres_service_name" {
  description = "Nome do serviço PostgreSQL"
  value       = kubernetes_service.postgres.metadata[0].name
}

output "ingress_url" {
  description = "URL do Ingress"
  value       = "https://${var.domain}"
}

output "namespace" {
  description = "Nome do namespace onde o aplicativo está implantado"
  value       = kubernetes_namespace.client_namespace.metadata[0].name
}
