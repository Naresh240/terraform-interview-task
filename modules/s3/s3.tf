resource "random_id" "id" {
  byte_length = 8
}

resource "aws_s3_bucket" "terraform" {
  bucket = "example-bucket-${lower(random_id.id.hex)}"
}

resource "aws_s3_bucket_acl" "terraform_bucket_acl" {
  bucket = aws_s3_bucket.terraform.id
  acl    = "private"
}

resource "aws_s3_bucket_policy" "s3policy" {
  bucket = aws_s3_bucket.terraform.id
  policy = data.aws_iam_policy_document.example.json
}

data "aws_iam_policy_document" "example" {
  statement {
    effect    = "Allow"
    principals {
      type = "AWS"
      identifiers = ["*"]
    }    
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.terraform.arn,
      "${aws_s3_bucket.terraform.arn}/*",
    ]
  }
}