terraform {
  required_version = ">= 0.10.3" # introduction of Local Values configuration language feature

  backend "s3" {
    bucket = "tf-state-interrobangc"
    region = "us-west-2"
    key    = "prod"
  }
}

module "main" {
  source = "../../"

  env = "prod"
}
