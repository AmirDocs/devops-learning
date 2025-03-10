variable "ami_id" {
  description = "AMI ID for the WordPress instance"
  default = "ami-0e8d228ad90af673b"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "security_group" {
  description = "Security group for the EC2 instance"
  type        = string
}

variable "db_name" {
  description = "Database name for WordPress"
  type        = string
  default     = "wordpress"
}

variable "db_user" {
  description = "Database user for WordPress"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database password for WordPress"
  type        = string
  default     = "your_password"
}
