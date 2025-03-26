data "github_repository" "app" {
  count = var.create_gh_repo == false ? 1 : 0
  name  = local.app_name
}

resource "github_repository" "app" {
  count                  = var.create_gh_repo ? 1 : 0
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
  repository    = local.gh_repo
  variable_name = "AWS_REGION"
  value         = var.region
}

resource "github_actions_variable" "iam_role_ci" {
  repository    = local.gh_repo
  variable_name = "AWS_IAM_ROLE_CI"
  value         = aws_iam_role.ci.name
}

resource "github_actions_variable" "ecr_repository" {
  repository    = local.gh_repo
  variable_name = "AWS_ECR_REPOSITORY"
  value         = aws_ecr_repository.app.name
}

resource "github_actions_secret" "account_id" {
  repository      = local.gh_repo
  secret_name     = "AWS_ACCOUNT_ID"
  plaintext_value = data.aws_caller_identity.current.account_id
}

resource "github_actions_secret" "access_key_id" {
  repository      = local.gh_repo
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = aws_iam_access_key.github_actions.id
}

resource "github_actions_secret" "secret_access_key" {
  repository      = local.gh_repo
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = aws_iam_access_key.github_actions.secret
}
