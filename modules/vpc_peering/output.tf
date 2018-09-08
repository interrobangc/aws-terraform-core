output "vpc_peering_id" {
  description = "Peering connection ID"
  value       = "${element(concat(aws_vpc_peering_connection.this.*.id, list("")), 0)}"
}
