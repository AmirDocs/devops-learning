# variable "db_name" {
#   description = "The name of the database"
#   type        = string
# }

# variable "db_user" {
#   description = "The database username"
#   type        = string
# }

# variable "db_password" {
#   description = "The database password"
#   type        = string
# }

# variable "ami_id" {
#   description = "AMI ID for the WordPress instance"
#   type        = string
# }

# variable "instance_type" {
#   description = "EC2 instance type"
#   type        = string
#   default     = "t2.micro"
# }

# variable "vpc_cidr" {
#   description = "The CIDR block for the VPC"
#   type        = string
# }

# variable "availability_zone" {
#   description = "The availability zone for the subnet"
#   type        = string
# }








# ### EC2 module variables 
# variable "ami_id" {
#   description = "AMI ID for the WordPress instance"
#   type        = string
#   default     = "ami-0e8d228ad90af673b"
# }

# variable "instance_type" {
#   description = "EC2 instance type"
#   type        = string
#   default     = "t2.micro"
# }

# variable "subnet_ids" {
#   description = "Subnet ID for the EC2 instance"            ###
#   type        = list(string)
# }

# variable "security_group" {
#   description = "Security group for the EC2 instance"
#   type        = string
# }

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

# variable "vpc_cidr" {
#   description = "The CIDR block for the VPC"
#   type        = string
#   default     = "10.0.0.0/16"
# }