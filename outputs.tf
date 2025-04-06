output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "private_subnet_ids" {
  description = "Private Subnet IDs for RDS and App Runner"
  value       = [aws_subnet.private_a.id, aws_subnet.private_c.id]
}

output "rds_sg_id" {
  description = "Security Group ID for RDS"
  value       = aws_security_group.rds_sg.id
}

output "rds_endpoint" {
  description = "RDS (Aurora) cluster endpoint"
  value       = aws_rds_cluster.aurora_pg.endpoint
}

output "rds_reader_endpoint" {
  description = "RDS (Aurora) reader endpoint"
  value       = aws_rds_cluster.aurora_pg.reader_endpoint
}

output "ecr_repository_url" {
  description = "ECR Repository URL"
  value       = aws_ecr_repository.rails8_api_apprunner.repository_url
}

output "app_runner_service_url" {
  description = "URL of the App Runner service"
  value       = aws_apprunner_service.rails8_api.service_url
}

output "app_runner_vpc_connector_arn" {
  description = "VPC Connector ARN used by App Runner"
  value       = aws_apprunner_vpc_connector.main.arn
}
