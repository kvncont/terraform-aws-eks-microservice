variable "region" {
  type        = string
  description = "The region in which the resources will be created."
}

variable "assume_role_arn" {
  type        = string
  description = "The ARN of the role that will be assumed by the terraform user."
}

variable "waypoint_application" {
  type        = string
  description = "Name of the application"
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]*$", var.waypoint_application))
    error_message = "The waypoint_application variable must start with a lowercase letter and can only contain lowercase letters, numbers, and hyphens (-)."
  }
}

variable "image_tag_mutability" {
  type        = string
  description = "The image tag mutability setting for the repository."
  validation {
    condition     = can(regex("^(MUTABLE|IMMUTABLE)$", var.image_tag_mutability))
    error_message = "The image_tag_mutability variable must be either MUTABLE or IMMUTABLE."
  }
}

variable "scan_on_push" {
  type        = bool
  description = "Whether to enable image scanning on push."
}

variable "lifecycle_policy" {
  type        = bool
  description = "Whether to enable the lifecycle policy for the ECR repository."
}

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster."
}

variable "namespace" {
  type        = string
  description = "The namespace of the services in Kubernetes."
}

variable "k8s_manifests_repo" {
  type        = string
  description = "The k8s manifests repository NAME."
}

variable "helm_chart_repo" {
  type        = string
  description = "The Helm chart repository name."
}

variable "create_gh_repo" {
  type        = bool
  description = "Whether to create a GitHub repository for the application or use an existing one."
}

variable "aws_access_key_id_github_actions" {
  type        = string
  description = "The AWS access key ID for GitHub Actions User."
  sensitive   = true
}

variable "aws_secret_access_key_github_actions" {
  type        = string
  description = "The AWS secret access key for GitHub Actions User."
  sensitive   = true
}
