resource "aws_s3_bucket" "artifact-bucket" {
  bucket = var.lifecycle-bucket-name
  acl    = "private"

  // The kms key is made in another workspace, for the same
  // reasons as the storage. You want to create modules with safe
  // bindings for ops, which means don't destroy the storage or the encryption
  // key just to rebuild the lambda. Also many lambdas may share encryption and storage.
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms-key-arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  // Throw away artifacts in the bucket after 30 days.
  lifecycle_rule {
    id      = "reaper"
    enabled = true

    prefix = "artifacts/"

    tags = {
      "rule"      = "reap"
      "autoclean" = "true"
    }

    expiration {
      days = 30
    }
  }
}

resource "aws_s3_bucket" "website-bucket" {
  bucket = var.website-bucket-name
  acl    = "private-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
