data "aws_eks_cluster" "k8s" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "k8s" {
  name = var.cluster_name
}

resource "kubernetes_manifest" "argocd_app" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind"       = "Application"
    "metadata" = {
      "name"      = var.waypoint_application
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
          "prune"     = true
          "selfHeal"  = true
        }
      }
    }
  }
}
