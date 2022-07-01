locals {
  tier_map = {
    "GeneralPurpose"  = "GP"
    "Basic"           = "B"
    "MemoryOptimized" = "MO"
  }

  administrator_password = var.administrator_password == "" ? random_password.mariadb_administrator_password.result : var.administrator_password
}
