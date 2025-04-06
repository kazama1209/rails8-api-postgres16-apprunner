resource "aws_security_group" "rds_sg" {
  name        = "rails8-api-apprunner-rds-sg"
  description = "Allow Postgres from App Runner"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "rails8-api-apprunner-rds-sg"
    Project     = "rails8-api-apprunner"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
