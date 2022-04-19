provider "mysql" {
  endpoint = format("%s:3306", azurerm_mariadb_server.mariadb_server.fqdn)
  username = local.administrator_login
  password = local.administrator_password

  tls = var.force_ssl
}

module "users" {
  source = "./modules/db-users"

  for_each = toset(var.create_databases_users ? var.databases_names : [])

  enable_user_suffix = var.enable_user_suffix
  user               = each.key
  database           = each.key
}
