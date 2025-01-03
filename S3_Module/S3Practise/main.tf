module "s3_bucket" {
  source           = "C:/Users/veerg/Documents/workspace/GR/S3_Module"   # Path to the S3 module
  bucket_name      = "my-practise-s3-bucket-12345532145685" # Replace with your bucket name
  enable_versioning = true               # Enable versioning
  tags = {
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}

# output "bucket_name" {
#   value = aws_s3_bucket.this.bucket
#}

