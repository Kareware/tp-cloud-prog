variable "source_bucket_name" {
  description = "Name of the source S3 bucket"
  type        = string
  default     = "image-bucket-eme"
}

variable "destination_bucket_name" {
  description = "Name of the destination S3 bucket"
  type        = string
  default     = "pdf-bucket-eme"
}