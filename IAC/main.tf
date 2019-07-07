variable region {
  default = "eu-central-1"
}

module modules {
  source = "./modules"
  region = "${var.region}"
}