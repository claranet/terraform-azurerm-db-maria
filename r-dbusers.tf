resource "random_password" "db_passwords" {
  count = var.create_databases_users ? length(var.databases_names) : 0

  special = false
  length  = 32
}

resource "mysql_user" "users" {
  count = var.create_databases_users ? length(var.databases_names) : 0

  provider = mysql.create-users

  user               = (var.enable_user_suffix ? format("%s_user", var.databases_names[count.index]) : var.databases_names[count.index])
  plaintext_password = random_password.db_passwords[count.index].result
  host               = "%"

  depends_on = [azurerm_mariadb_database.mariadb_db, azurerm_mariadb_firewall_rule.mariadb_fw_rule]
}

resource "mysql_grant" "roles" {
  count = var.create_databases_users ? length(var.databases_names) : 0

  provider = mysql.create-users

  user       = (var.enable_user_suffix ? format("%s_user", var.databases_names[count.index]) : var.databases_names[count.index])
  host       = "%"
  database   = var.databases_names[count.index]
  privileges = ["ALL"]

  depends_on = [mysql_user.users]
}
