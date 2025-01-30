resource "kubernetes_namespace" "my-ns" {
    for_each = toset(var.enviroment)
    metadata {
        name = each.key
    }
}

resource "kubernetes_deployment" "app" {
    for_each = toset(var.enviroment)
    metadata {
        name = var.app_name
        namespace = each.key
        labels = {
          app = var.app_name
        }
    }
}

  
