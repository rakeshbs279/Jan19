resource "aws_s3_bucket" "Jan2" {
  bucket = var.bucket_name
  #acl    = "private"

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "Jan2" {
  bucket = aws_s3_bucket.Jan2.bucket

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}
