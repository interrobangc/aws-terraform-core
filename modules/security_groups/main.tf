resource "aws_security_group" "allow_ingress" {
  count = "${var.create_security_groups}"

  name        = "allow_ingress"
  description = "Allow all inbound traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Terraform = "true"
    Name      = "allow_ingress"
    env       = "${var.env}"
  }
}

resource "aws_security_group" "allow_egress" {
  count = "${var.create_security_groups}"

  name        = "allow_egress"
  description = "Allow all outbound traffic"
  vpc_id      = "${var.vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Terraform = "true"
    Name      = "allow_egress"
    env       = "${var.env}"
  }
}

resource "aws_security_group" "public_web" {
  count = "${var.create_security_groups}"

  name        = "public_web"
  description = "Allow public http/s ingress"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Terraform = "true"
    Name      = "public_web"
    env       = "${var.env}"
  }
}

resource "aws_security_group" "public_ssh" {
  count = "${var.create_security_groups}"

  name        = "public_ssh"
  description = "Allow public ssh ingress"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Terraform = "true"
    Name      = "public_ssh"
    env       = "${var.env}"
  }
}
