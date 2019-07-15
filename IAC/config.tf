terraform {
  backend s3 {
    bucket  = "kumite-recorder"
    region  = "eu-central-1"
    key     = "IAC/terraform.tfstate"
    encrypt = true
    profile = "kumite"
  }
}

provider aws {
  region = "eu-central-1"
  profile = "kumite"
}