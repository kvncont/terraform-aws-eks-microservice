terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.91.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.36.0"
    }
  }
}

provider "aws" {
  region = var.region
  assume_role {
    role_arn = var.assume_role_arn
  }
  default_tags {
    tags = {
      managed_by = "terraform"
    }
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.shared.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.shared.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.shared.token
}