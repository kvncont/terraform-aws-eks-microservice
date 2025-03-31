data "github_repository" "k8s_manifests" {
  name = var.k8s_manifests_repo
}

resource "kubernetes_manifest" "argocd_app_k8s_manifests" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind"       = "Application"
    "metadata" = {
      "name"      = "${local.app_name}-k8s-manifests"
      "namespace" = "argocd"
    }
    "spec" = {
      "project" = "default"
      "source" = {
        "repoURL"        = data.github_repository.k8s_manifests.html_url
        "targetRevision" = "main"
        "path"           = "${local.env}/${local.app_name}"
      }
      "destination" = {
        "server"    = "https://kubernetes.default.svc"
        "namespace" = var.namespace
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

# data "github_repository" "ms_control_plane" {
#   name = var.helm_chart_repo
# }

# resource "kubernetes_manifest" "argocd_app_helm_chart" {
#   manifest = {
#     "apiVersion" = "argoproj.io/v1alpha1"
#     "kind"       = "Application"
#     "metadata" = {
#       "name"      = "${local.app_name}-helm-chart"
#       "namespace" = "argocd"
#     }
#     "spec" = {
#       "project" = "default"
#       "source" = {
#         "repoURL"        = data.github_repository.ms_control_plane.html_url
#         "targetRevision" = "main"
#         "chart"          = data.github_repository.ms_control_plane.name
#         "helm" = {
#           "valueFiles" = [
#             "values/${local.env}/${local.app_name}.yml"
#           ]
#         }
#       }
#       "destination" = {
#         "server"    = "https://kubernetes.default.svc"
#         "namespace" = var.namespace
#       }
#       "syncPolicy" = {
#         "automated" = {
#           "prune"    = true
#           "selfHeal" = true
#         }
#       }
#     }
#   }
# }