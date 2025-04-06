resource "aws_apprunner_service" "rails8_api" {
  service_name = "rails8-api"

  source_configuration {
    authentication_configuration {
      access_role_arn = data.aws_iam_role.apprunner_ecr_access.arn
    }

    image_repository {
      image_identifier      = "${aws_ecr_repository.rails8_api_apprunner.repository_url}:latest"
      image_repository_type = "ECR"
      image_configuration {
        port = "3000"
        runtime_environment_variables = {
          RAILS_ENV       = "production"
          DATABASE_URL    = "postgres://${var.db_username}:${var.db_password}@${aws_rds_cluster.aurora_pg.endpoint}:5432/${var.db_name}"
          SECRET_KEY_BASE = "${var.rails_secret_key_base}"
        }
      }
    }
    auto_deployments_enabled = true
  }

  instance_configuration {
    cpu    = 256
    memory = 512
  }

  network_configuration {
    egress_configuration {
      egress_type        = "VPC"
      vpc_connector_arn  = aws_apprunner_vpc_connector.main.arn
    }
  }

  tags = {
    Project     = "rails8-api-apprunner"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
