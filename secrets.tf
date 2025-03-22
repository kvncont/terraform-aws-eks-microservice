resource "aws_secretsmanager_secret" "app" {
  name        = local.app_name
  description = "Secret for the ${local.app_name} application"
}
