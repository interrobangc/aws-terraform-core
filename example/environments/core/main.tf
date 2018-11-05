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

  # runing redundant nat gatweays requires an increaes to the default
  # VPC ElasticIP limit from at least 5 to 6. In our demo we only run
  # a single nat gateway per VPC. In production, you should run 1 per
  # AZ.
  mgmt_enable_nat_gateway = true
  mgmt_single_nat_gateway = true
  prod_enable_nat_gateway = true
  prod_single_nat_gateway = true
  dev_enable_nat_gateway  = true
  dev_single_nat_gateway  = true
}
