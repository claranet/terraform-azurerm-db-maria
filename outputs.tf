output "mariadb_administrator_login" {
  value       = "${azurerm_mariadb_server.mariadb_server.administrator_login}@${azurerm_mariadb_server.mariadb_server.name}"
  description = "Administrator login for mariadb server"
  sensitive   = true
}

output "mariadb_administrator_password" {
  value       = local.administrator_password
  description = "Administrator password for mariadb server"
  sensitive   = true
}

output "mariadb_databases" {
  value       = azurerm_mariadb_database.mariadb_db
  description = "Map of databases infos"
}

output "mariadb_databases_names" {
  value       = var.databases_names
  description = "List of databases names"
}

output "mariadb_database_ids" {
  description = "List of all database resource ids"
  value       = [for db in azurerm_mariadb_database.mariadb_db : db.id]
}

output "mariadb_firewall_rules" {
  value       = azurerm_mariadb_firewall_rule.mariadb_fw_rule
  description = "Map of mariadb created rules"
}

output "mariadb_fqdn" {
  value       = azurerm_mariadb_server.mariadb_server.fqdn
  description = "FQDN of the mariadb server"
}

output "mariadb_server_id" {
  value       = azurerm_mariadb_server.mariadb_server.id
  description = "mariadb server ID"
}

output "mariadb_vnet_rules" {
  value       = azurerm_mariadb_virtual_network_rule.vnet_rules
  description = "The map of all vnet rules"
}

output "mariadb_databases_users" {
  value       = var.create_databases_users ? toset([for u in module.users : u.user]) : []
  description = "List of DB users"
}

output "mariadb_databases_user_passwords" {
  value = var.create_databases_users ? tomap({
    for k, u in module.users : u.user => u.password
  }) : {}
  description = "The map of all users/password"
  sensitive   = true
}

output "mariadb_configurations" {
  value       = azurerm_mariadb_configuration.mariadb_config
  description = "The map of all mariadb configurations set"
}
