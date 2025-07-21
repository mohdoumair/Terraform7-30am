variable "subnet_ids" {
  type = list(string)
  description = "List of subnet IDs for the RDS subnet group"
}

variable "instance_class" {}
variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
