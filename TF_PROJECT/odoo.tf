resource "kubernetes_deployment" "odoo" {
  metadata {
    name      = "odoo"
    namespace = kubernetes_namespace.client_namespace.metadata[0].name
  }

  spec {
    replicas = var.replicas 

    selector {
      match_labels = {
        app = "odoo"
      }
    }

    template {
      metadata {
        labels = {
          app = "odoo"
        }
      }
      
      spec {
        container {
          name  = "odoo"
          image = "odoo:16"
          port {
            container_port = 8069
          }
          
          env {
            name  = "HOST"
            value = "postgres-service"
          }
          env {
            name  = "USER"
            value = var.postgres_user 
          }
          env {
            name  = "PASSWORD"
            value = var.postgres_password
          }
          env {
            name  = "DB_NAME"
            value = var.postgres_db 
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "odoo" {
  metadata {
    name      = "odoo-service"
    namespace = kubernetes_namespace.client_namespace.metadata[0].name
  }

  spec {
    selector = {
      app = "odoo-service"
    }
    port {
      port        = 80
      target_port = 8069
    }
    type = "ClusterIP"
  }
}