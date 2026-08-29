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
  description = "CIDR block allowed to reach the instance over SSH (port 22). Only the operator needs this, so keep it to a single address with /32. The default is the RFC 5737 documentation range, which belongs to nobody: applying without overriding it builds a security group that lets no one in, instead of one open to the whole internet. Set your real IP in a gitignored terraform.tfvars - see terraform.tfvars.example."
  type        = string
  default     = "203.0.113.10/32"
}

variable "http_allowed_cidr" {
  description = "CIDR block allowed to reach the instance over HTTP (port 80). Unlike SSH, this one is meant to be public: a web server only its owner can reach serves no purpose, so 0.0.0.0/0 is the correct value here rather than a compromise."
  type        = string
  default     = "0.0.0.0/0"
}
