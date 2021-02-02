locals {
  tier_map = {
    "GeneralPurpose"  = "GP"
    "Basic"           = "B"
    "MemoryOptimized" = "MO"
  }

  administrator_login    = format("%s@%s", azurerm_mariadb_server.mariadb_server.administrator_login, azurerm_mariadb_server.mariadb_server.name)
  administrator_password = var.administrator_password == "" ? random_password.mariadb_administrator_password.result : var.administrator_password

  # db_users_login = formatlist("%s@%s", mysql_user.users[*].user, azurerm_mariadb_server.mariadb_server.name)
}
