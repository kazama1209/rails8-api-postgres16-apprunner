resource "aws_rds_cluster" "aurora_pg" {
  cluster_identifier      = "rails8-api-apprunner-aurora-pg-cluster"
  engine                  = "aurora-postgresql"
  engine_version          = "16.6"
  database_name           = var.db_name
  master_username         = var.db_username
  master_password         = var.db_password
  backup_retention_period = 1
  preferred_backup_window = "07:00-09:00"
  db_subnet_group_name    = aws_db_subnet_group.default.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  storage_encrypted       = true

  serverlessv2_scaling_configuration {
    min_capacity = 0.5
    max_capacity = 2
  }

  deletion_protection = false
  skip_final_snapshot = true

  tags = {
    Project     = "rails8-api-apprunner"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}

resource "aws_rds_cluster_instance" "aurora_pg_instance" {
  identifier              = "rails8-api-apprunner-aurora-pg-instance-1"
  cluster_identifier      = aws_rds_cluster.aurora_pg.id
  instance_class          = "db.serverless"
  engine                  = aws_rds_cluster.aurora_pg.engine
  engine_version          = aws_rds_cluster.aurora_pg.engine_version
  publicly_accessible     = false
  db_subnet_group_name    = aws_db_subnet_group.default.name

  tags = {
    Project     = "rails8-api-apprunner"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "rails8-api-apprunner-aurora-pg-subnet-group"
  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_c.id
  ]

  tags = {
    Name        = "rails8-api-apprunner-aurora-pg-subnet-group"
    Project     = "rails8-api-apprunner"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
