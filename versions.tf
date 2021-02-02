terraform {
  required_version = ">= 0.13.6"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.42"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~> 1.1"
    }
    mysql = {
      source  = "terraform-providers/mysql"
      version = ">= 1.6"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 1.9"
    }
  }
}
