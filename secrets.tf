resource "aws_secretsmanager_secret" "app" {
  name                    = "${local.app_name}/generic"
  description             = "Secret for the ${local.app_name} application"
  recovery_window_in_days = 0
}
