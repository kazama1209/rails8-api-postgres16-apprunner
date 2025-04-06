# rails8-api-postgres16-apprunner

https://github.com/kazama1209/rails8-api-postgres16
Terrfaform Codes for deploying the above sample app.

# Setup

```
$ terraform init
```

## Push Docker image to ECR

```
$ terraform apply --target=aws_ecr_repository.rails8_api_apprunner
```

（After cloning “rails8-api-postgres16” and moving to its root directory）
```
$ aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.ap-northeast-1.amazonaws.com

$ docker buildx build --no-cache --platform=linux/x86_64 -f Dockerfile.prd -t rails8-api-apprunner .

$ docker tag rails8-api-apprunner:latest <aws_account_id>.dkr.ecr.ap-northeast-1.amazonaws.com/rails8-api-apprunner:latest

$ docker push <aws_account_id>.dkr.ecr.ap-northeast-1.amazonaws.com/rails8-api-apprunner:latest
```

## Create RDS

```
$ terraform apply \
  --target=aws_rds_cluster.aurora_pg \
  --target=aws_rds_cluster_instance.aurora_pg_instance
```

## Create remaining resources

```
$ terraform apply

Outputs:

app_runner_service_url = "xxxxxxxxxx.ap-northeast-1.awsapprunner.com"
```

## Check API Response

```
$ curl https://xxxxxxxxxx.ap-northeast-1.awsapprunner.com/api/v1/users

{
  "users": [
    {
      "id": 1,
      "name": "山田 太郎",
      "email": "yamada_t@example.com"
    },
    {
      "id": 2,
      "name": "山田 花子",
      "email": "yamada_h@example.com"
    }
  ]
}
```
