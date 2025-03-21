data "aws_eks_cluster" "shared" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "shared" {
  name = var.cluster_name
}

resource "kubernetes_manifest" "argocd_app" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind"       = "Application"
    "metadata" = {
      "name"      = local.app_name
      "namespace" = var.argocd_namespace
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
