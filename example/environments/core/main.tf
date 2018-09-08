terraform {
  required_version = ">= 0.10.3" # introduction of Local Values configuration language feature

  backend "s3" {
    bucket = "tf-state-interrobangc"
    region = "us-west-2"
    key    = "core"
  }
}

module "core" {
  # When you create your own module, this should be a git source
  source = "../../../"

  # To decrease testing cost/time. Should be commented out or
  # set to 2 in production.
  bastion_count = 1

  # If you create the full stack, you will hit the ElasticIP limit of 5
  # request an increase before you enable this.
  create_prod_vpc = false
}
