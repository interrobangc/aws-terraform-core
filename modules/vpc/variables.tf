variable "env" {
  description = "Environment we are running in"
  default     = "default"
}

variable "azs" {
  type        = "list"
  description = "A list of availability zones in the region"
  default     = ["us-west-2a", "us-west-2b"]
}

variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  default     = true
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  type        = "list"
  description = "A list of private subnets inside the VPC"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  type        = "list"
  description = "A list of public subnets inside the VPC"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "create_database_subnet_group" {
  description = "Controls if database subnet group should be created"
  default     = true
}

variable "database_subnets" {
  type        = "list"
  description = "A list of database subnets"
  default     = ["10.0.201.0/24", "10.0.202.0/24"]
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = true
}

variable "enable_vpn_gateway" {
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"
  default     = false
}

variable "map_public_ip_on_launch" {
  description = "On public subnets do you want to default to a public IP"
  default     = false
}
