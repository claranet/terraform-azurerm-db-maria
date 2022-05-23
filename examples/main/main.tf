terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0.0"
    }
    mysql = {
      source  = "terraform-providers/mysql"
      version = ">= 1.9"
    }
  }
}

provider "azurerm" {
  features {}
}
