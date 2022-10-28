resource "azurerm_mariadb_virtual_network_rule" "vnet_rules" {
  for_each            = var.vnet_rules == null ? {} : var.vnet_rules
  name                = each.key
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mariadb_server.mariadb_server.name
  subnet_id           = each.value
}
