terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.42"
    }
    mysql = {
      source  = "terraform-providers/mysql"
      version = ">= 1.9"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~> 1.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}
