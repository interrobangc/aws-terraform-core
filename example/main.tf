data "terraform_remote_state" "core" {
  backend = "s3"

  config {
    bucket = "tf-state-interrobangc"
    region = "us-west-2"
    key    = "core"
  }
}

locals {
  env_data        = "${data.terraform_remote_state.core.data["${var.env}"]}"
  subnets         = "${local.env_data["subnets"]}"
  private_subnets = "${local.subnets["private"]}"
  public_subnets  = "${local.subnets["public"]}"
  sgs             = "${local.env_data["sgs"]}"
  vpc_id          = "${data.terraform_remote_state.core.vpc_ids["${var.env}"]}"
}

resource "aws_key_pair" "terraform_ec2_key" {
  key_name   = "${var.env}_terraform_ec2_key"
  public_key = "${file("./.ssh/terraform.pub")}"
}

data "aws_ami" "www" {
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:Service"
    values = ["www"]
  }

  most_recent = true
}

module "www" {
  source = "github.com/interrobangc/terraform-aws-alb-service?ref=v0.1.1"

  name = "www"
  env  = "${var.env}"
  ami  = "${data.aws_ami.www.id}"

  min_size = "${var.www_min_size}"
  max_size = "${var.www_max_size}"
  vpc_id   = "${local.vpc_id}"

  service_subnets = ["${local.private_subnets}"]

  alb_subnets = ["${local.public_subnets}"]

  instance_security_groups = [
    "${local.sgs["bastion_ssh"]}",
    "${local.sgs["allow_egress"]}",
  ]

  alb_security_groups = [
    "${local.sgs["public_web"]}",
    "${local.sgs["allow_egress"]}",
  ]
}
