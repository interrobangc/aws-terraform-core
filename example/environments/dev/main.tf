terraform {
  required_version = ">= 0.10.3" # introduction of Local Values configuration language feature

  backend "s3" {
    bucket = "tf-state-interrobangc"
    region = "us-west-2"
    key    = "dev"
  }
}

module "main" {
  source = "../../"

  env = "dev"

  # www_min_size = 2
  www_max_size = 1
}
