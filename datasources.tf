data "aws_caller_identity" "current" {}

data "aws_eks_cluster" "shared" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "shared" {
  name = var.cluster_name
}