variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "wordpress"
}

variable "db_user" {
  description = "The database username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "The database password"
  type        = string
  default     = "your_password"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "security_group" {
  description = "Security group for the RDS instance"
  type        = string
}
