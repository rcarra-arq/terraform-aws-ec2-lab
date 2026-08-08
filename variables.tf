variable "aws_region" {
  description = "AWS region where the resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance (Amazon Linux 2 in us-east-1)"
  type        = string
  default     = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the existing EC2 key pair used for SSH access"
  type        = string
  default     = "vockey"
}

variable "instance_name" {
  description = "Value of the Name tag applied to the instance and its security group"
  type        = string
  default     = "terraform-demo"
}

variable "ssh_allowed_cidr" {
  description = "CIDR block allowed to reach the instance over SSH. Use your own IP (e.g. 203.0.113.10/32) in real use; 0.0.0.0/0 opens SSH to the whole internet and is only acceptable for a short-lived lab."
  type        = string
  default     = "0.0.0.0/0"
}
