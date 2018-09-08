terraform {
  required_version = ">= 0.10.3" # introduction of Local Values configuration language feature
}

resource "aws_security_group" "elb_source" {
  name        = "${var.name}_elb_source"
  description = "Used as ssh source for ${var.name}_elb_destination policy"
  vpc_id      = "${var.vpc_id}"

  tags = {
    Terraform = "true"
    Name      = "${var.name}_elb_source"
    env       = "${var.env}"
  }
}

module "elb" {
  source = "github.com/terraform-aws-modules/terraform-aws-elb?ref=v1.4.1"

  name = "${var.name}"

  number_of_instances = "${var.count}"
  instances           = ["${var.instances}"]

  internal = "${var.internal}"
  subnets  = ["${var.subnets}"]

  security_groups = [
    "${aws_security_group.elb_source.id}",
    "${var.security_groups}",
  ]

  listener = [
    {
      instance_port     = "${var.instance_port}"
      instance_protocol = "${var.instance_protocol}"
      lb_port           = "${var.lb_port}"
      lb_protocol       = "${var.lb_protocol}"
    },
  ]

  health_check = [
    {
      target              = "${var.ht_protocol}:${var.ht_target}"
      interval            = 30
      healthy_threshold   = 2
      unhealthy_threshold = 2
      timeout             = 5
    },
  ]

  tags = {
    Terraform = "true"
    env       = "${var.env}"
  }
}

resource "aws_security_group" "elb_destination" {
  name        = "${var.name}_elb_destination"
  description = "Allows access from instance ${var.name}"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port       = "${var.instance_port}"
    to_port         = "${var.instance_port}"
    protocol        = "tcp"
    security_groups = ["${aws_security_group.elb_source.id}"]
  }

  tags = {
    Terraform = "true"
    Name      = "${var.name}_elb_destination"
    env       = "${var.env}"
  }
}
