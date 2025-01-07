module "s3_bucket" {
  source            = "../S3-module"
  bucket_name       = "my-practise-s3-bucket-12345532145685"
  enable_versioning = "Enabled"
  tags = {
    app         = "prac"
    environment = "uat"
  }
}

# output "bucket_name" {
#   value = aws_s3_bucket.this.bucket
#}

