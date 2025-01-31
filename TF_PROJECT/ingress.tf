resource "kubernetes_ingress_v1" "odoo_ingress" {
  metadata {
    name      = "odoo-ingress"
    namespace = kubernetes_namespace.client_namespace.metadata[0].name
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect" = "true"  
      "nginx.ingress.kubernetes.io/force-ssl-redirect" = "true"  
    }
  }
  spec {
    tls {
      hosts       = [var.domain]  
      secret_name = "${var.namespace}-tls-secret"  
    }

    rule {
      host = var.domain
      http {
        path {
          path = "/"
          backend {
            service {
              name = "odoo"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}