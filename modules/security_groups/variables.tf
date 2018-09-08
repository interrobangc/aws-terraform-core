variable "create_security_groups" {
  description = "Should we create security groups?"
  default     = true
}

variable "env" {
  description = "Environment we are running in"
  default     = "default"
}

variable "vpc_id" {
  description = "VPC id for security policy"
}
