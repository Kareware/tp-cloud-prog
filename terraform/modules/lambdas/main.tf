# IAM role for Lambda execution
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.4"
    }
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

#data "archive_file" "lambda_zip" {
#  type        = "zip"
#  source_dir  = var.lambda_handler_source_dir
#  output_path = var.lambda_handler_zip_path
#}

resource "aws_iam_role" "image2pdf_lambda" {
  name               = "${var.lambda_function_name}_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "s3_access" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${var.source_bucket_arn}/*"]
  }
  statement {
    actions   = ["s3:PutObject"]
    resources = ["${var.destination_bucket_arn}/*"]
  }
  statement {
    actions   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_role_policy" "s3_access" {
  name   = "${var.lambda_function_name}_s3_access"
  role   = aws_iam_role.image2pdf_lambda.id
  policy = data.aws_iam_policy_document.s3_access.json
}

# Lambda function
resource "aws_lambda_function" "image2pdf_lambda" {
  role          = aws_iam_role.image2pdf_lambda.arn
  filename      = var.lambda_handler_zip_path
  function_name = var.lambda_function_name
  handler       = var.lambda_handler
  runtime = var.lambda_runtime
}
