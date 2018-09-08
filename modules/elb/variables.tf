variable "env" {
  description = "Environment we are running in"
  default     = "default"
}

variable "name" {
  description = "Name of elb"
}

variable "vpc_id" {
  description = "VPC id for security rules"
}

variable "count" {
  description = "Number of instances"
  default     = 0
}

variable "instances" {
  type        = "list"
  description = "Instances to attach to"
  default     = []
}

variable "subnets" {
  type        = "list"
  description = "Subnets for LB"
}

variable "security_groups" {
  type        = "list"
  description = "Security Groups for LB"
}

variable "internal" {
  description = "Toggle internal load balancer"
  default     = false
}

variable "instance_port" {
  description = "Port on instance"
  default     = "80"
}

variable "instance_protocol" {
  description = "Port on instance"
  default     = "http"
}

variable "lb_port" {
  description = "Port on lb"
  default     = "80"
}

variable "lb_protocol" {
  description = "Port on lb"
  default     = "http"
}

variable "ht_protocol" {
  description = "Port on instance"
  default     = "HTTP"
}

variable "ht_target" {
  description = "Port on instance"
  default     = "80/"
}
