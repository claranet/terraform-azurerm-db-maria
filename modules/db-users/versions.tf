terraform {
  required_version = ">= 0.14"
  required_providers {
    mysql = {
      source  = "terraform-providers/mysql"
      version = ">= 1.9"
    }
  }
}
