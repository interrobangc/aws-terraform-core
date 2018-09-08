output "id" {
  description = "The ID of the ASG"
  value       = "${module.asg.this_autoscaling_group_id}"
}

output "name" {
  description = "The name of the ASG"
  value       = "${module.asg.this_autoscaling_group_name}"
}
