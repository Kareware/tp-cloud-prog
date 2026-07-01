variable "aws_region" {
  description = "Name of the AWS region to deploy resources"
  type        = string
  default     = "eu-west-3"
}
variable "role_arn" {
  description = "ARN of the IAM role to assume for Terraform"
  type        = string
  default     = "arn:aws:iam::738563260931:role/role_etudiants"
}