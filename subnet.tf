resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = false

  tags = {
    Name        = "rails8-api-apprunner-private-subnet-a"
    Project     = "rails8-api-apprunner"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = false

  tags = {
    Name        = "rails8-api-apprunner-private-subnet-c"
    Project     = "rails8-api-apprunner"
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
