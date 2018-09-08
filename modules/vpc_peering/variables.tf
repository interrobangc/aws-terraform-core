variable "create_vpc_peering" {
  description = "Should we create vpc pairing"
  default     = true
}

variable "owner_account_id" {
  description = "AWS owner account ID"
  default     = ""
}

variable "vpc_peer_id" {
  description = "Peer VPC ID"
  default     = ""
}

variable "vpc_id" {
  description = "This VPC ID"
  default     = ""
}

variable "source_private_route_count" {
  description = "A count of private route tables"
  default     = 0
}

variable "source_private_route_table_ids" {
  type        = "list"
  description = "A list of private route tables"
  default     = []
}

variable "source_public_route_count" {
  description = "A count of public route tables"
  default     = 0
}

variable "source_public_route_table_ids" {
  type        = "list"
  description = "A list of public route tables"
  default     = []
}

variable "source_peer_cird_block" {
  description = "Peer VPC CIDR block"
  default     = ""
}

variable "target_private_route_count" {
  description = "A count of private route tables"
  default     = 0
}

variable "target_private_route_table_ids" {
  type        = "list"
  description = "A list of private route tables"
  default     = []
}

variable "target_public_route_count" {
  description = "A count of public route tables"
  default     = 0
}

variable "target_public_route_table_ids" {
  type        = "list"
  description = "A list of public route tables"
  default     = []
}

variable "target_peer_cird_block" {
  description = "Peer VPC CIDR block"
  default     = ""
}

variable "auto_accept_peering" {
  description = "Auto accept peering connection"
  default     = false
}
