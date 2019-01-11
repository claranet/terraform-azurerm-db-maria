output "azure_mariadb_id" {
  value       = "${azurerm_mariadb_server.mariadb_server.id}"
  description = "Mariadb instance id"
}

output "azure_mariadb_fqdn" {
  value       = "${azurerm_mariadb_server.mariadb_server.fqdn}"
  description = "Mariadb generated fqdn"
}

output "azure_mariadb_db_names" {
  value       = "${azurerm_mariadb_database.mariadb_db.*.name}"
  description = "List of database names"
}

output "azure_mariadb_login" {
  value       = "${azurerm_mariadb_server.mariadb_server.administrator_login}@${azurerm_mariadb_server.mariadb_server.name}"
  sensitive   = true
  description = "Username"
}
