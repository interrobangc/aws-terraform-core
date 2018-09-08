output "allow_ingress" {
  value = "${element(concat(aws_security_group.allow_ingress.*.id, list("")), 0)}"
}

output "allow_egress" {
  value = "${element(concat(aws_security_group.allow_egress.*.id, list("")), 0)}"
}

output "public_web" {
  value = "${element(concat(aws_security_group.public_web.*.id, list("")), 0)}"
}

output "public_ssh" {
  value = "${element(concat(aws_security_group.public_ssh.*.id, list("")), 0)}"
}
