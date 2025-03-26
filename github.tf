# data "github_repository" "app" {
#   full_name = "kvncont/k8s-todo"
# }

resource "github_repository" "app" {
  name                   = local.app_name
  description            = "My awesome codebase"
  visibility             = "public"
  delete_branch_on_merge = true
  # archive_on_destroy     = true

  template {
    owner                = "kvncont"
    repository           = "tpl-aws-eks-python"
    include_all_branches = false
  }

  depends_on = [
    aws_ecr_repository.app,
    aws_iam_access_key.github_actions
  ]
}

resource "github_actions_variable" "region" {
  # repository    = data.github_repository.app.full_name
  repository    = github_repository.app.name
  variable_name = "AWS_REGION"
  value         = var.region
}

resource "github_actions_variable" "iam_role_ci" {
  # repository    = data.github_repository.app.full_name
  repository    = github_repository.app.name
  variable_name = "AWS_IAM_ROLE_CI"
  value         = aws_iam_role.ci.name
}

resource "github_actions_variable" "ecr_repository" {
  # repository    = data.github_repository.app.full_name
  repository    = github_repository.app.name
  variable_name = "AWS_ECR_REPOSITORY"
  value         = aws_ecr_repository.app.name
}

resource "github_actions_secret" "account_id" {
  repository      = github_repository.app.name
  secret_name     = "AWS_ACCOUNT_ID"
  plaintext_value = data.aws_caller_identity.current.account_id
}

resource "github_actions_secret" "access_key_id" {
  repository      = github_repository.app.name
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = aws_iam_access_key.github_actions.id
}

resource "github_actions_secret" "secret_access_key" {
  repository      = github_repository.app.name
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = aws_iam_access_key.github_actions.secret
}
