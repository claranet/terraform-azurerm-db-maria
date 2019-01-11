# Azure Mariadb

This feature generates a mariadb server with one or several databases. 

## Prerequisites

* module.az-region.location|location-short: git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/regions.git?ref=v1.0.0
* module.rg.resource_group_name: git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/rg.git?ref=v0.1.0

## Usage

```shell

module "az-region" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/regions.git?ref=vX.X.X"
  azure_region = "${var.azure_region}"
}

module "rg" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/rg.git?ref=vX.X.X"

  location     = "${module.az-region.location}"
  client_name  = "${var.client_name}"
  environment  = "${var.environment}"
  stack        = "${var.stack}"
}

module "db-maria" {
  source = "git@git.fr.clara.net:claranet/cloudnative/projects/cloud/azure/terraform/features/db-maria.git?ref=vX.X.X"
  #Mandatory variables
  location               = "${module.az-region.location}"
  location_short         = "${module.az-region.location-short}"
  resource_group_name    = "${module.rg.resource_group_name}"
  client_name            = "${var.client_name}"
  environment            = "${var.environment}"
  stack                  = "${var.stack}"
  sql_user               = "${var.sql_user}"
  sql_pass               = "${var.sql_pass}"
  db_names               = "${var.db_names}"
  db_charset             = "${var.db_charset}"
  db_collation           = "${var.db_collation}"

  #Optional variables
  extra_tags		 	= "${var.extra_tags}"
  custom_server_name	    	= "${var.custom_server_name}"
  server_sku			= "${var.server_sku}"
  server_storage_profile	= "${var.server_storage_profile}"
  mariadb_ssl_enforcement	= "${var.mariadb_ssl_enforcement}"
  mariadb_version		= "${var.mariadb_version}"

  #To allow connections from external IPs:
  include_firewall_rule		= "true"
  firewall_rule 		= {
    rule_name = "claranet_vpn"
    start-ip-address = "185.88.104.18"
    end-ip-address = "185.88.104.18"
  }

  #To allow connections from vms on a custom subnet, provide the subnet id in the rule below:
  include_vnet_rule		= "true"
  vnet_rule			= {
    rule_name   = "allowclientvnet"
    subnet      = "${module.subnet.subnet_ids[0]}"
  } 
}


```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| client\_name | Name of client | string | n/a | yes |
| custom\_server\_name | Specifies a custom name for the Mariadb Server. Changing this forces a new resource to be created. | string | `""` | no |
| db\_charset | Specifies the Charset for each MariaDB Database : https://mariadb.com/kb/en/library/setting-character-sets-and-collations/ | map | n/a | yes |
| db\_collation | Specifies the Collation for each MariaDB Database : https://mariadb.com/kb/en/library/setting-character-sets-and-collations/ | map | n/a | yes |
| db\_names | List of databases names | list | n/a | yes |
| environment | Name of application's environnement | string | n/a | yes |
| extra\_tags | Extra tags to add | map | `<map>` | no |
| firewall\_rule | Firewall rule to allow IPs to connect to the databases. | map | `<map>` | no |
| include\_firewall\_rule | Set to true or false to create or not a firewall rule | string | `"false"` | no |
| include\_vnet\_rule | Set to true or false to create or not a vnet rule | string | `"false"` | no |
| location | Azure region in which the web app will be hosted | string | n/a | yes |
| location\_short | Azure region trigram | string | n/a | yes |
| mariadb\_ssl\_enforcement | Possible values are Enforced and Disabled | string | `"Disabled"` | no |
| mariadb\_version | Valid value is 10.2. https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#version | string | `"10.2"` | no |
| resource\_group\_name | Name of the Resource Group | string | n/a | yes |
| server\_sku | Server class : https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#sku | map | `<map>` | no |
| server\_storage\_profile | Storage configuration : https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#storage_profile | map | `<map>` | no |
| sql\_pass | Strong Password : https://docs.microsoft.com/en-us/sql/relational-databases/security/strong-passwords?view=sql-server-2017 | string | n/a | yes |
| sql\_user | Sql username | string | n/a | yes |
| stack | Name of application stack | string | n/a | yes |
| vnet\_rule | Vnet rule to allow communications from every node that is on a given subnet. | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| azure\_mariadb\_db\_names | List of database names |
| azure\_mariadb\_fqdn | Mariadb generated fqdn |
| azure\_mariadb\_id | Mariadb instance id |
| azure\_mariadb\_login | Username |
