locals {
  app_name      = regex("(.*)-[^-]+$", var.waypoint_application)[0]
  app_role_name = "EKSMicroExecutionRoleFor${replace(title(local.app_name), "-", "")}"
  ci_role_name  = "CIRoleFor${replace(title(local.app_name), "-", "")}"
  gh_repo       = var.create_gh_repo ? github_repository.app[0].name : data.github_repository.app[0].name
}
