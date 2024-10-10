resource "azurerm_mariadb_server" "mariadb_server" {
  name                = local.server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = join("_", [lookup(local.tier_map, var.tier, "GeneralPurpose"), "Gen5", var.capacity])

  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  storage_mb                   = var.storage_mb
  auto_grow_enabled            = var.auto_grow_enabled

  administrator_login              = var.administrator_login
  administrator_login_password     = local.administrator_password
  version                          = var.mariadb_version
  ssl_enforcement_enabled          = var.force_ssl
  ssl_minimal_tls_version_enforced = var.force_ssl ? var.force_min_tls : "TLSEnforcementDisabled"
  public_network_access_enabled    = var.public_network_access_enabled

  tags = merge(local.default_tags, var.extra_tags)
}

resource "azurerm_mariadb_database" "mariadb_db" {
  for_each            = toset(var.databases_names)
  name                = var.use_caf_naming_for_databases ? data.azurecaf_name.mariadb_dbs[each.value].result : each.value
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mariadb_server.mariadb_server.name
  charset             = lookup(var.databases_charset, each.value, "utf8mb4")
  collation           = lookup(var.databases_collation, each.value, "utf8mb4_unicode_ci")
}

resource "azurerm_mariadb_configuration" "mariadb_config" {
  for_each            = var.mariadb_configurations
  name                = each.key
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mariadb_server.mariadb_server.name
  value               = each.value
}

resource "random_password" "mariadb_administrator_password" {
  length           = 32
  special          = true
  override_special = "@#%&*()-_=+[]{}<>:?"
}
