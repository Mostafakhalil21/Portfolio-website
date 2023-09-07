resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname

}


resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.mybucket.id
    key = "index.html"
    source = "index.html"
    acl = "public-read"
    content_type = "text/html"
  
}
resource "aws_s3_object" "error" {
    bucket = aws_s3_bucket.mybucket.id
    key = "error.html"
    source = "error.html"
    acl = "public-read"
    content_type = "text/html"
  
}
resource "aws_s3_object" "thanks" {
    bucket = aws_s3_bucket.mybucket.id
    key = "thanks.html"
    source = "thanks.html"
    acl = "public-read"
    content_type = "text/html"
  
}
resource "aws_s3_object" "style" {
    bucket = aws_s3_bucket.mybucket.id
    key = "style.css"
    source = "style.css"
    acl = "public-read"
    content_type = "text/css"
  
}
resource "aws_s3_object" "thanksCss" {
    bucket = aws_s3_bucket.mybucket.id
    key = "thanks.css"
    source = "thanks.css"
    acl = "public-read"
    content_type = "text/css"
  
}
resource "aws_s3_object" "javascript" {
    bucket = aws_s3_bucket.mybucket.id
    key = "app.js"
    source = "app.js"
    acl = "public-read"
    content_type = "application/javascript"
  
}

resource "aws_s3_bucket_object" "image1" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "images/practitioner.png"
  source       = "images/AWS-Certified-Cloud-Practitioner_badge.634f8a21af2e0e956ed8905a72366146ba22b74c.png"
  content_type = "image/png"
  acl = "public-read"
}

resource "aws_s3_bucket_object" "image2" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "images/Solutions.png"
  source       = "images/AWS-Certified-Solutions-Architect-Associate_badge.3419559c682629072f1eb968d59dea0741772c0f.png"
  content_type = "image/png"
  acl = "public-read"
}

resource "aws_s3_bucket_object" "image3" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "images/Monitoring.png"
  source       = "images/Monitoring App.png"
  content_type = "image/png"
  acl = "public-read"
}
resource "aws_s3_bucket_object" "image4" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "images/profile.jpeg"
  source       = "images/WhatsApp Image 2022-09-23 at 13.26.43.jpeg"
  content_type = "image/jpeg"
  acl = "public-read"
}
resource "aws_s3_bucket_object" "image5" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "images/subcar.jpeg"
  source       = "images/WhatsApp Image 2022-09-24 at 00.02.10.jpeg"
  content_type = "image/jpeg"
  acl = "public-read"
}
resource "aws_s3_bucket_object" "image6" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "images/store.jpeg"
  source       = "images/WhatsApp Image 2022-09-24 at 00.57.31.jpeg"
  content_type = "image/jpeg"
  acl = "public-read"
}
resource "aws_s3_bucket_object" "image7" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "images/portfolio.png"
  source       = "images/portfolio-website.png"
  content_type = "image/png"
  acl = "public-read"
}
resource "aws_s3_bucket_object" "cvfile" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "cvfile/MostafaCV2023.pdf"
  source       = "cvFile/MostafaCV2023.pdf"
  content_type = "application/pdf"
  acl = "public-read"
}


# website configuration
resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

#   routing_rule {
#     condition {
#       key_prefix_equals = "docs/"
#     }
#     redirect {
#       replace_key_prefix_with = "documents/"
#     }
#   }

depends_on = [ aws_s3_bucket_acl.example ]
}