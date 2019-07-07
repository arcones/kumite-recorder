terraform {
  backend s3 {
    bucket  = "kumite-state"
    region  = "eu-central-1"
    key     = "kumite-recorder/global/s3/terraform.tfstate"
    encrypt = true
  }
}

provider aws {
  region  = "eu-central-1"
  //TODO pending to use specific profile
}

resource aws_s3_bucket kumite_state {
  bucket = "kumite-state"
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