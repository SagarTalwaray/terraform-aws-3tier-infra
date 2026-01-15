
locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "${local.name_prefix}-bucket"

  tags = {
    Name        = "${local.name_prefix}-bucket"
    Environment = var.environment
  }
}

resource "aws_dynamodb_table" "app_table" {
  name         = "${local.name_prefix}-table"
  billing_mode = "PAYPERREQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name        = "${local.name_prefix}-table"
    Environment = var.environment
  }
}
