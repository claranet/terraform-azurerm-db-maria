resource "azurerm_mariadb_server" "mariadb_server" {
  name                         = "${local.server_name}"
  location                     = "${var.location}"
  resource_group_name          = "${var.resource_group_name}"
  sku                          = ["${var.server_sku}"]
  storage_profile              = ["${var.server_storage_profile}"]
  administrator_login          = "${var.sql_user}"
  administrator_login_password = "${var.sql_pass}"
  version                      = "${var.mariadb_version}"
  ssl_enforcement              = "${var.mariadb_ssl_enforcement}"
  tags                         = "${merge(local.default_tags, var.extra_tags)}"
}

resource "azurerm_mariadb_database" "mariadb_db" {
  charset             = "${lookup(var.db_charset, element(var.db_names, count.index))}"
  collation           = "${lookup(var.db_collation, element(var.db_names, count.index))}"
  name                = "${element(var.db_names, count.index)}"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${azurerm_mariadb_server.mariadb_server.name}"
  count               = "${length(var.db_names)}"
}

data "azurerm_subscription" "current" {}

resource "null_resource" "db_firewall_rule" {
  count = "${var.include_firewall_rule ? 1 : 0}"

  provisioner "local-exec" {
    command = <<CMD
        az account set -s ${data.azurerm_subscription.current.subscription_id}
        az mariadb server firewall-rule create \
	  --name ${lookup(var.firewall_rule,"rule_name")} \
	  --resource-group ${var.resource_group_name} \
	  --server-name ${local.server_name} \
	  --start-ip-address ${lookup(var.firewall_rule,"start-ip-address")} \
	  --end-ip-address ${lookup(var.firewall_rule,"end-ip-address")}
    CMD
  }

  depends_on = ["azurerm_mariadb_database.mariadb_db"]
}

resource "null_resource" "db_vnet_rule" {
  count = "${var.include_vnet_rule ? 1 : 0}"

  provisioner "local-exec" {
    command = <<CMD
        az account set -s ${data.azurerm_subscription.current.subscription_id}
        az mariadb server vnet-rule create \
	  --name ${lookup(var.vnet_rule,"rule_name")} \
	  --resource-group ${var.resource_group_name} \
	  --server-name ${local.server_name} \
	  --subnet ${lookup(var.vnet_rule,"subnet")}
    CMD
  }

  depends_on = ["azurerm_mariadb_database.mariadb_db"]
}
