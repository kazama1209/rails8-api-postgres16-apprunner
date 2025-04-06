resource "aws_ecr_repository" "rails8_api_apprunner" {
  name = "rails8-api-apprunner"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Project     = "rails8-api-apprunner"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
