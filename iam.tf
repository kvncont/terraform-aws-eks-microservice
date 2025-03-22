resource "aws_iam_role" "app" {
  name = local.app_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "pods.eks.amazonaws.com"
        }
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
      }
    ]
  })
}

resource "aws_eks_pod_identity_association" "app" {
  cluster_name    = data.aws_eks_cluster.shared.name
  namespace       = var.backend_namespace
  service_account = local.app_name
  role_arn        = aws_iam_role.app.arn
}