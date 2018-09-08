output "id" {
  description = "The name of the ELB"
  value       = "${module.elb.this_elb_id}"
}

output "arn" {
  description = "The ARN of the ELB"
  value       = "${module.elb.this_elb_arn}"
}

output "name" {
  description = "The name of the ELB"
  value       = "${module.elb.this_elb_name}"
}

output "dns_name" {
  description = "The DNS name of the ELB"
  value       = "${module.elb.this_elb_dns_name}"
}

output "instances" {
  description = "The list of instances in the ELB"
  value       = ["${module.elb.this_elb_instances}"]
}

output "source_security_group_id" {
  description = "The ID of the security group that you can use as part of your inbound rules for your load balancer's back-end application instances"
  value       = "${module.elb.this_elb_source_security_group_id}"
}

output "zone_id" {
  description = "The canonical hosted zone ID of the ELB (to be used in a Route 53 Alias record)"
  value       = "${module.elb.this_elb_zone_id}"
}

output "destination_security_group_id" {
  description = "The ID of the security group that allows access from this lb."
  value       = "${aws_security_group.elb_destination.id}"
}
