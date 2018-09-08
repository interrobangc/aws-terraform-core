output "data" {
  value = "${module.core.data}"
}

output "vpc_ids" {
  value = "${module.core.vpc_ids}"
}

output "bastion_public_ip" {
  value = "${module.core.bastion_public_ip}"
}
