terraform {
  required_version = ">= 0.14"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.10"
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
