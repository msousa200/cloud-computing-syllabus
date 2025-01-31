resource "kubernetes_deployment" "postgres" {
  metadata {
    name      = "postgres"
    namespace = kubernetes_namespace.client_namespace.metadata[0].name
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "postgres"
      }
    }

    template {
      metadata {
        labels = {
          app = "postgres"
        }
      }
      
      spec {
        container {
          name  = "postgres"
          image = "postgres:16"
          port {
            container_port = 5432
          }
          
          env {
            name  = "POSTGRES_USER"
            value = var.postgres_user 
          }
          env {
            name  = "POSTGRES_PASSWORD"
            value = var.postgres_password 
          }
          env {
            name  = "POSTGRES_DB"
            value = var.postgres_db
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "postgres" {
  metadata {
    name      = "postgres-service"
    namespace = kubernetes_namespace.client_namespace.metadata[0].name
  }
  spec {
    selector = {
      app = "postgres"
    }
    port {
      port        = 5432
      target_port = 5432
    }
    type = "ClusterIP"
  }
}