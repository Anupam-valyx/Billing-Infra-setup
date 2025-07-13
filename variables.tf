variable "vpc_cidr" {
  description = "CIDR block for the primary VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "availability_zone" {
  type    = string
  default = "ap-south-1a"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Key pair for EC2 SSH"
  type        = string
}

variable "allowed_ssh_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "allowed_api_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "peer_vpc_cidr" {
  description = "CIDR block for feeder VPC"
  type        = string
}

variable "peer_vpc_id" {
  description = "VPC ID of the peer (feeder) VPC"
  type        = string
}