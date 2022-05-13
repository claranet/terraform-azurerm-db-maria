resource "azurerm_mariadb_firewall_rule" "mariadb_fw_rule" {
  for_each = var.authorized_cidrs
  name     = each.key

  server_name         = azurerm_mariadb_server.mariadb_server.name
  resource_group_name = var.resource_group_name

  start_ip_address = cidrhost(each.value, 0)
  end_ip_address   = cidrhost(each.value, -1)
}
