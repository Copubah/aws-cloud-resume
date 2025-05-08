resource "aws_s3_bucket" "resume_bucket" {
  bucket = "opubacharles"
  
  # Website configuration
  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags = {
    Project = "Cloud Resume"
    Owner   = "Charles Opuba"
  }
}

resource "aws_s3_bucket_ownership_controls" "resume_bucket_ownership" {
  bucket = aws_s3_bucket.resume_bucket.id
  
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "resume_bucket_public_access" {
  bucket = aws_s3_bucket.resume_bucket.id

  block_public_acls   = false
  ignore_public_acls  = false
  block_public_policy = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "resume_bucket_policy" {
  bucket = aws_s3_bucket.resume_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.resume_bucket.arn}/*"
      }
    ]
  })
}

output "website_url" {
  value = aws_s3_bucket.resume_bucket.website_endpoint
}
