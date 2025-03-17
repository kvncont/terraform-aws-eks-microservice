resource "aws_ecr_repository" "app" {
  name                 = var.waypoint_application
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  tags = var.tags
}

resource "aws_ecr_lifecycle_policy" "app" {
  count = var.lifecycle_policy ? 1 : 0

  repository = aws_ecr_repository.app.name
  policy     = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 30 images"
        selection = {
          tagStatus   = "any"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = 90
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}