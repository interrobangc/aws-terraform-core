variable "region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "mgmt_env" {
  description = "Environment we are running mgmt in"
  default     = "mgmt"
}

variable "mgmt_azs" {
  type        = "list"
  description = "A list of availability zones in the region for mgmt"
  default     = ["us-west-2a", "us-west-2b"]
}

variable "mgmt_cidr" {
  description = "The CIDR block for the mgmt VPC."
  default     = "10.10.0.0/16"
}

variable "mgmt_private_subnets" {
  type        = "list"
  description = "A list of private subnets inside the mgmt PC"
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "mgmt_public_subnets" {
  type        = "list"
  description = "A list of public subnets inside the mgmt VPC"
  default     = ["10.10.101.0/24", "10.10.102.0/24"]
}

variable "mgmt_create_database_subnet_group" {
  description = "Controls if database subnet group should be created"
  default     = false
}

variable "mgmt_database_subnets" {
  type        = "list"
  description = "A list of database subnets"
  default     = []
}

variable "mgmt_enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks in mgmt"
  default     = true
}

variable "mgmt_enable_vpn_gateway" {
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC in mgmt"
  default     = true
}

variable "bastion_count" {
  description = "Number of bastiones (defaults to one per subnet)"
  default     = false
}

variable "create_prod_vpc" {
  description = "Controls if prod VPC should be created (it affects almost all resources)"
  default     = true
}

variable "prod_env" {
  description = "Environment we are running prod in"
  default     = "prod"
}

variable "prod_azs" {
  type        = "list"
  description = "A list of availability zones in the region for prod"
  default     = ["us-west-2a", "us-west-2b"]
}

variable "prod_cidr" {
  description = "The CIDR block for the prod VPC."
  default     = "10.0.0.0/16"
}

variable "prod_private_subnets" {
  type        = "list"
  description = "A list of private subnets inside the prod PC"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "prod_public_subnets" {
  type        = "list"
  description = "A list of public subnets inside the prod VPC"
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "prod_create_database_subnet_group" {
  description = "Controls if database subnet group should be created"
  default     = true
}

variable "prod_database_subnets" {
  type        = "list"
  description = "A list of database subnets"
  default     = ["10.0.201.0/24", "10.0.202.0/24"]
}

variable "prod_enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks in prod"
  default     = true
}

variable "prod_enable_vpn_gateway" {
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC in prod"
  default     = false
}

variable "create_dev_vpc" {
  description = "Controls if dev VPC should be created (it affects almost all resources)"
  default     = true
}

variable "dev_env" {
  description = "Environment we are running dev in"
  default     = "dev"
}

variable "dev_azs" {
  type        = "list"
  description = "A list of availability zones in the region for dev"
  default     = ["us-west-2a", "us-west-2b"]
}

variable "dev_cidr" {
  description = "The CIDR block for the dev VPC."
  default     = "10.1.0.0/16"
}

variable "dev_private_subnets" {
  type        = "list"
  description = "A list of private subnets inside the dev PC"
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "dev_public_subnets" {
  type        = "list"
  description = "A list of public subnets inside the dev VPC"
  default     = ["10.1.101.0/24", "10.1.102.0/24"]
}

variable "dev_create_database_subnet_group" {
  description = "Controls if database subnet group should be created"
  default     = true
}

variable "dev_database_subnets" {
  type        = "list"
  description = "A list of database subnets"
  default     = ["10.1.201.0/24", "10.1.202.0/24"]
}

variable "dev_enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks in dev"
  default     = true
}

variable "dev_enable_vpn_gateway" {
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC in dev"
  default     = false
}

variable "map_public_ip_on_launch" {
  description = "On public subnets do you want to default to a public IP"
  default     = false
}
