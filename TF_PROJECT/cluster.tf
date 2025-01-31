resource "kubernetes_role" "custom_app_role" {
  metadata {
    name      = "custom-app-role"
    namespace = kubernetes_namespace.client_namespace.metadata[0].name
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "services", "configmaps", "secrets"]
    verbs      = ["get", "list", "watch", "create", "update", "patch", "delete"]
  }

  rule {
    api_groups = ["apps"]
    resources  = ["deployments", "statefulsets"]
    verbs      = ["get", "list", "watch", "create", "update", "delete"]
  }
}

resource "kubernetes_role_binding" "custom_app_role_binding" {
  metadata {
    name      = "custom-app-role-binding"
    namespace = kubernetes_namespace.client_namespace.metadata[0].name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.custom_app_role.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = "custom-service-account"
    namespace = kubernetes_namespace.client_namespace.metadata[0].name 
  }
}