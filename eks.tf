data "aws_eks_cluster" "shared" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "shared" {
  name = var.cluster_name
}

resource "aws_eks_pod_identity_association" "app" {
  cluster_name    = data.aws_eks_cluster.shared.name
  namespace       = var.backend_namespace
  service_account = local.app_name
  role_arn        = aws_iam_role.app.arn
}