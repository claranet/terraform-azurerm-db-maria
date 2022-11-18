data "azurecaf_name" "mariadb" {
  name          = var.stack
  resource_type = "azurerm_mariadb_server"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.client_name, var.location_short, var.environment, local.name_suffix, var.use_caf_naming ? "" : "mariadb"])
  use_slug      = var.use_caf_naming
  clean_input   = true
  separator     = "-"
}

data "azurecaf_name" "mariadb_dbs" {
  for_each = toset(var.databases_names)

  name          = var.stack
  resource_type = "azurerm_mariadb_database"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.client_name, var.location_short, var.environment, local.name_suffix, each.value, var.use_caf_naming ? "" : "mariadb"])
  use_slug      = var.use_caf_naming
  clean_input   = true
  separator     = "-"
}
