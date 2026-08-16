output "cloudfront_url" {
  description = "The HTTPS URL of the CloudFront distribution"
  value       = "https://${aws_cloudfront_distribution.portfolio.domain_name}"
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.portfolio.id
}

output "cloudfront_distribution_id" {
  description = "The CloudFront distribution ID (used for cache invalidation)"
  value       = aws_cloudfront_distribution.portfolio.id
}
