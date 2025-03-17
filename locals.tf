locals {
  app_role_name    = "EKSMicroExecutionRoleFor${replace(title(var.waypoint_application), "-", "")}"
}