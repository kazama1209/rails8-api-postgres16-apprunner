resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name        = "rails8-api-apprunner-vpc"
    Project     = "rails8-api-apprunner"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}

resource "aws_apprunner_vpc_connector" "main" {
  vpc_connector_name = "rails8-api-apprunner-vpc-connector"
  subnets            = [
    aws_subnet.private_a.id,
    aws_subnet.private_c.id
  ]
  security_groups    = [aws_security_group.rds_sg.id]

  tags = {
    Project     = "rails8-api-apprunner"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
