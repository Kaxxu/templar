variable "name" {
  description = "Project name"
}

variable "environment" {
  description = "Environment name"
}

variable "client" {
  description = "Client Name"
}

variable "service" {
  description = "Service"
  default     = "Discord"
}

variable "organization" {
  description = "Organization name"
  default     = "Yutani"
}

variable "cidr" {
  description = "CIDR used"
  default     = "10.1.0.0/16"
}

variable "cidr_block" {
  description = "CIDR block used"
  default     = "0.0.0.0/0"
}

variable "instance_type" {
  description = "Type of instance used in EC2"
  default     = "t4g.nano"
}
