# ---------------------------------------------------------
# S3 BUCKET
# ---------------------------------------------------------

resource "aws_s3_bucket" "portfolio" {
  bucket = var.bucket_name

  tags = {
    Name        = "Charles Portfolio"
    Environment = "production"
    Project     = "aws-cloud-resume"
  }
}


# ---------------------------------------------------------
# S3 BUCKET OWNERSHIP
# ---------------------------------------------------------

resource "aws_s3_bucket_ownership_controls" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}


# ---------------------------------------------------------
# S3 PUBLIC ACCESS BLOCK
# ---------------------------------------------------------

resource "aws_s3_bucket_public_access_block" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


# ---------------------------------------------------------
# S3 VERSIONING
# ---------------------------------------------------------

resource "aws_s3_bucket_versioning" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  versioning_configuration {
    status = "Enabled"
  }
}


# ---------------------------------------------------------
# CLOUDFRONT ORIGIN ACCESS CONTROL
# ---------------------------------------------------------

resource "aws_cloudfront_origin_access_control" "portfolio" {
  name                              = "portfolio-oac"
  description                       = "Origin Access Control for portfolio S3 bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}


# ---------------------------------------------------------
# CLOUD POLICY DOCUMENT
# Allows CloudFront to read objects from the private S3 bucket
# ---------------------------------------------------------

data "aws_iam_policy_document" "portfolio" {

  statement {
    sid    = "AllowCloudFrontServicePrincipalReadOnly"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.portfolio.arn}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"

      values = [
        aws_cloudfront_distribution.portfolio.arn
      ]
    }
  }
}


# ---------------------------------------------------------
# S3 BUCKET POLICY
# ---------------------------------------------------------

resource "aws_s3_bucket_policy" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id
  policy = data.aws_iam_policy_document.portfolio.json

  depends_on = [
    aws_s3_bucket_public_access_block.portfolio
  ]
}


# ---------------------------------------------------------
# CLOUDFRONT DISTRIBUTION
# ---------------------------------------------------------

resource "aws_cloudfront_distribution" "portfolio" {

  enabled = true

  comment = "Charles Opuba AWS Cloud Resume Portfolio"

  default_root_object = "index.html"


  # -------------------------------------------------------
  # S3 ORIGIN
  # -------------------------------------------------------

  origin {
    domain_name = aws_s3_bucket.portfolio.bucket_regional_domain_name

    origin_id = "S3-${aws_s3_bucket.portfolio.id}"

    origin_access_control_id = aws_cloudfront_origin_access_control.portfolio.id
  }


  # -------------------------------------------------------
  # DEFAULT CACHE BEHAVIOR
  # -------------------------------------------------------

  default_cache_behavior {

    allowed_methods = [
      "GET",
      "HEAD"
    ]

    cached_methods = [
      "GET",
      "HEAD"
    ]

    target_origin_id = "S3-${aws_s3_bucket.portfolio.id}"

    viewer_protocol_policy = "redirect-to-https"


    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }


  # -------------------------------------------------------
  # GEO RESTRICTIONS
  # -------------------------------------------------------

  restrictions {

    geo_restriction {
      restriction_type = "none"
    }
  }


  # -------------------------------------------------------
  # HTTPS
  # Uses CloudFront's default certificate
  # No custom domain required
  # -------------------------------------------------------

  viewer_certificate {
    cloudfront_default_certificate = true
  }


  # -------------------------------------------------------
  # ERROR RESPONSES
  # -------------------------------------------------------

  custom_error_response {
    error_code         = 404
    response_code      = 404
    response_page_path = "/index.html"
  }


  # -------------------------------------------------------
  # TAGS
  # -------------------------------------------------------

  tags = {
    Name        = "Charles Portfolio CloudFront"
    Environment = "production"
    Project     = "aws-cloud-resume"
  }
}
