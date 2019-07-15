variable region {
  default = "eu-central-1"
}

resource aws_s3_bucket kumite_recorder {
  bucket = "kumite-recorder"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Application = "kumite-recorder"
  }
}

module modules {
  source = "./modules"
}