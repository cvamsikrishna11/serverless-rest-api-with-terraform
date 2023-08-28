resource "aws_s3_bucket" "bucket" {
  bucket = "${var.project_name}-${terraform.workspace}-${var.bucket_name}"
  tags = merge({ Environment = "${terraform.workspace}" }, var.common_tags)
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket.id 
  key    = "movies.json" 
  source = "./data-sources/movies.json"
  acl    = "private"
}