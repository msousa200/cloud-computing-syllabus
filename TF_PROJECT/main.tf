resource "kubernetes_namespace" "client_namespace" {
  metadata {
    name = "${var.client_name}-${var.environment}"
  }
}


