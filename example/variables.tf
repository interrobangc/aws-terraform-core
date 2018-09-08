variable "env" {
  description = "Environment"
  default     = "default"
}

variable "www_min_size" {
  description = "Minimum number of www instances"
  default     = 1
}

variable "www_max_size" {
  description = "Maximum number of www instances"
  default     = 2
}
