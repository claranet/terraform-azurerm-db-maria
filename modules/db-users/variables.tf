variable "user" {
  type = string
}

variable "password" {
  type    = string
  default = null
}

variable "database" {
  type = string
}

variable "enable_user_suffix" {
  type    = bool
  default = false
}

variable "host" {
  type    = string
  default = "%"
}

variable "privileges" {
  type    = list(any)
  default = ["ALL"]
}
