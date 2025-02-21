module "db_maria" {
  source  = "claranet/db-maria/azurerm"
  version = "x.x.x"

  client_name    = var.client_name
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  environment    = var.environment
  stack          = var.stack

  resource_group_name = module.rg.resource_group_name

  tier     = "GeneralPurpose"
  capacity = 4

  authorized_cidrs = {
    rule1 = "10.0.0.0/24"
    rule2 = "12.34.56.78/32"
  }

  storage_mb                   = 5120
  backup_retention_days        = 10
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = false

  administrator_login = var.administrator_login
  # administrator_password = var.administrator_password

  force_ssl = true

  databases_names     = ["mydatabase"]
  databases_collation = { mydatabase = "utf8_general_ci" }
  databases_charset   = { mydatabase = "utf8" }

  logs_destinations_ids = [
    module.logs.logs_storage_account_id,
    module.logs.log_analytics_workspace_id
  ]

  extra_tags = {
    foo = "bar"
  }
}

locals {
  administrator_login = format("%s@%s", module.db_maria.mariadb_administrator_login, module.db_maria.mariadb_server_name)
}

provider "mysql" {
  endpoint = format("%s:3306", module.db_maria.mariadb_fqdn)
  username = local.administrator_login
  password = module.db_maria.mariadb_administrator_password

  tls = true
}

module "mysql_users" {
  source  = "claranet/users/mysql"
  version = "x.x.x"

  # user_suffix_enabled = true

  user      = "claranet-db"
  databases = module.db_maria.mariadb_databases_names
}
