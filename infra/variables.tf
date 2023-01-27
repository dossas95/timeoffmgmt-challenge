variable "region" {
  description = "Region in which the infra will be deployed"
  default     = "us-east1"
}

variable "db_username" {
  description = "Name of the user with access to the database"
}

variable "db_user_pass" {
  description = "Password for the database user"
}