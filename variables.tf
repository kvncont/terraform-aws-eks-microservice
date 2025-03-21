variable "region" {
  type        = string
  description = "The region in which the resources will be created."
}

variable "arn_role" {
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

variable "backend_namespace" {
  type        = string
  description = "The namespace of the backend services in Kubernetes."
}

variable "argocd_namespace" {
  type        = string
  description = "The namespace where Argo CD is installed."
}

variable "repo_url" {
  type        = string
  description = "The URL of the Git repository containing the Kubernetes manifests."
}

variable "manifest_path" {
  type        = string
  description = "The path within the Git repository to the Kubernetes manifests."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resources."
}
