terraform {
  required_version = ">= 0.13.6"
  required_providers {
    mysql = {
      source  = "terraform-providers/mysql"
      version = ">= 1.9"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 1.9"
    }
  }
}
