module "eks_microservice" {
  source = "../"

  cluster_name                         = "example-cluster"
  region                               = "us-east-1"
  namespace                            = "example-namespace"
  assume_role_arn                      = "arn:aws:iam::123456789012:role/example-role"
  waypoint_application                 = "example-app-dev"
  create_gh_repo                       = false
  image_tag_mutability                 = "MUTABLE"
  scan_on_push                         = true
  lifecycle_policy                     = true
  aws_access_key_id_github_actions     = "example-access-key-id"
  aws_secret_access_key_github_actions = "example-secret-access-key"
}
