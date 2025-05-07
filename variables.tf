variable "region" {
  description = "The AWS region to deploy the resources"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The globally unique name of the S3 bucket for the resume website"
}
