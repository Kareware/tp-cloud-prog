variable "source_bucket_id" {
  description = "ID of the source S3 bucket"
  type = string
}

variable "source_bucket_arn" {
  description = "ARN of the source S3 bucket"
  type = string
}

variable "destination_bucket_id" {
  description = "ID of the destination S3 bucket"
  type = string
}

variable "destination_bucket_arn" {
  description = "ARN of the destination S3 bucket"
  type = string
}

variable "lambda_handler_source_dir" {
  description = "Path to the directory containing the Lambda function code"
  type        = string
  default     = "../lambda"
}

variable "lambda_handler_zip_path" {
  description = "Path to the Lambda function zip file"
  type        = string
  default     = "../lambda_function.zip"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "image2pdf_lambda"
}

variable "lambda_handler" {
  description = "Handler for the Lambda function"
  type        = string
  default     = "lambda.handler"
}

variable "lambda_runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  default     = "python3.12"
}