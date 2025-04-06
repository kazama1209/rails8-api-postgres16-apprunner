variable "db_name" {
  description = "DB Name"
  type        = string
}

variable "db_username" {
  description = "DB Username"
  type        = string
}

variable "db_password" {
  description = "DB Password"
  type        = string
  sensitive   = true
}

variable "rails_secret_key_base" {
  description = "Rails Secret Key Base"
  type        = string
}
