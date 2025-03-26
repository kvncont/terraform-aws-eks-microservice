output "ecr_repository_url" {
  description = "The URL of the ECR repository."
  value       = aws_ecr_repository.app.repository_url
}

output "ecr_repository_arn" {
  description = "The ARN of the ECR repository."
  value       = aws_ecr_repository.app.arn
}

output "ecr_repository_name" {
  description = "The name of the ECR repository."
  value       = aws_ecr_repository.app.name
}

output "app_iam_role_arn" {
  description = "The arn of the role."
  value       = aws_iam_role.app.arn
}

output "app_iam_role_name" {
  description = "The name of the role"
  value       = aws_iam_role.app.name
}

output "ci_iam_role_arn" {
  description = "The arn of the role."
  value       = aws_iam_role.ci.arn
}

output "ci_iam_role_name" {
  description = "The name of the role"
  value       = aws_iam_role.ci.name
}