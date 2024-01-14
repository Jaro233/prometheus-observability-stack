variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "my_ip" {
  description = "Your public IP address for SSH access"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, stage, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "The project name to be used in resource naming"
  type        = string
  default     = "myproject"
}

variable "ingress_rules" {
  description = "List of maps containing ingress rule specifications"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = []
}

variable "egress_rules" {
  description = "List of maps defining egress rules"
  type = list(object({
    description      = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    self             = bool
  }))
  default = []
}
