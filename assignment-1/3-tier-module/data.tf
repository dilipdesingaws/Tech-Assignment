data "aws_secretsmanager_secret" "by-arn" {
  arn = "arn:aws:secretsmanager:us-east-1:415692045603:secret:webapp_db_password-8gw0Ec"
}

data "aws_secretsmanager_secret_version" "db-secret" {
  secret_id = "${data.aws_secretsmanager_secret.by-arn.id}"
}


