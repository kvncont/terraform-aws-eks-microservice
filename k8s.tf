resource "kubernetes_manifest" "argocd_app" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind"       = "Application"
    "metadata" = {
      "name"      = local.app_name
      "namespace" = "argocd"
    }
    "spec" = {
      "project" = "default"
      "source" = {
        "repoURL"        = var.repo_url
        "targetRevision" = "main"
        "path"           = var.manifest_path
      }
      "destination" = {
        "server"    = "https://kubernetes.default.svc"
        "namespace" = var.backend_namespace
      }
      "syncPolicy" = {
        "automated" = {
          "prune"    = true
          "selfHeal" = true
        }
      }
    }
  }
}
