# Azure Mariadb
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/db-maria/azurerm/)

This module creates a [MariaDB Server](https://docs.microsoft.com/en-us/azure/mariadb/) with one or several databases.

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 7.x.x       | 1.3.x             | >= 3.0          |
| >= 6.x.x       | 1.x               | >= 3.0          |
| >= 5.x.x       | 0.15.x            | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "logs" {
  source  = "claranet/run-common/azurerm//modules/logs"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.resource_group_name
}

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

  for_each = toset(module.db_maria.mariadb_databases_names)

  user_suffix_enabled = true
  user                = each.key
  database            = each.key
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2, >= 1.2.22 |
| azurerm | ~> 3.22 |
| random | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| diagnostics | claranet/diagnostic-settings/azurerm | 6.2.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_mariadb_configuration.mariadb_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_configuration) | resource |
| [azurerm_mariadb_database.mariadb_db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_database) | resource |
| [azurerm_mariadb_firewall_rule.mariadb_fw_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_firewall_rule) | resource |
| [azurerm_mariadb_server.mariadb_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_server) | resource |
| [azurerm_mariadb_virtual_network_rule.vnet_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_virtual_network_rule) | resource |
| [random_password.mariadb_administrator_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurecaf_name.mariadb](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/data-sources/name) | data source |
| [azurecaf_name.mariadb_dbs](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| administrator\_login | MariaDB administrator login. | `string` | `"dbadmin"` | no |
| administrator\_password | MariaDB administrator password. Auto-generated if empty. Strong Password: https://docs.microsoft.com/en-us/sql/relational-databases/security/strong-passwords?view=sql-server-2017 | `string` | `""` | no |
| authorized\_cidrs | Map of authorized CIDRs (keys are rule names). | `map(string)` | `{}` | no |
| auto\_grow\_enabled | Enable/Disable auto-growing of the storage. | `bool` | `false` | no |
| backup\_retention\_days | Backup retention days for the server, supported values are between 7 and 35 days. | `number` | `10` | no |
| capacity | Capacity for MariaDB server SKU: https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#sku_name | `number` | `4` | no |
| client\_name | Client name/account used in naming. | `string` | n/a | yes |
| custom\_diagnostic\_settings\_name | Custom name of the diagnostics settings, name will be 'default' if not set. | `string` | `"default"` | no |
| custom\_server\_name | Custom Server Name identifier | `string` | `""` | no |
| databases\_charset | Specifies the charset for each MariaDB Database: https://mariadb.com/kb/en/library/setting-character-sets-and-collations/ | `map(string)` | `{}` | no |
| databases\_collation | Specifies the collation for each MariaDB Database: https://mariadb.com/kb/en/library/setting-character-sets-and-collations/ | `map(string)` | `{}` | no |
| databases\_names | List of databases names | `list(string)` | n/a | yes |
| default\_tags\_enabled | Option to enable or disable default tags | `bool` | `true` | no |
| environment | Project/Application environment. | `string` | n/a | yes |
| extra\_tags | Extra tags to add | `map(string)` | `{}` | no |
| force\_ssl | Specifies if SSL should be enforced on connections. | `bool` | `true` | no |
| geo\_redundant\_backup\_enabled | Turn Geo-redundant server backups on/off. Not available for the Basic tier. | `bool` | `true` | no |
| location | Azure region to use. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| logs\_categories | Log categories to send to destinations. | `list(string)` | `null` | no |
| logs\_destinations\_ids | List of destination resources IDs for logs diagnostic destination.<br>Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.<br>If you want to specify an Azure EventHub to send logs and metrics to, you need to provide a formated string with both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the `|` character. | `list(string)` | n/a | yes |
| logs\_metrics\_categories | Metrics categories to send to destinations. | `list(string)` | `null` | no |
| logs\_retention\_days | Number of days to keep logs on storage account. | `number` | `30` | no |
| mariadb\_configurations | MariaDB configurations to enable. | `map(string)` | `{}` | no |
| mariadb\_version | Specifies the version of MariaDB to use. Possible values are `10.2` and `10.3` | `string` | `"10.2"` | no |
| name\_prefix | Optional prefix for the generated name | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name | `string` | `""` | no |
| public\_network\_access\_enabled | Enable public network access for this MariaDB server. | `bool` | `false` | no |
| resource\_group\_name | Name of the application ressource group. | `string` | n/a | yes |
| stack | Project/Application stack name. | `string` | n/a | yes |
| storage\_mb | Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs. | `number` | `5120` | no |
| tier | Tier for MariaDB server SKU: https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#sku_name Possible values are: `GeneralPurpose`, `Basic`, `MemoryOptimized` | `string` | `"GeneralPurpose"` | no |
| use\_caf\_naming | Use the Azure CAF naming provider to generate default resource name. `custom_server_name` override this if set. Legacy default name is used if this is set to `false`. | `bool` | `true` | no |
| use\_caf\_naming\_for\_databases | Use the Azure CAF naming provider to generate databases name. | `bool` | `false` | no |
| vnet\_rules | Map of VNet rules to create (keys are rule names, values are Subnet IDs). | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| mariadb\_administrator\_login | Administrator login for mariadb server |
| mariadb\_administrator\_password | Administrator password for mariadb server |
| mariadb\_configurations | The map of all mariadb configurations set |
| mariadb\_database\_ids | List of all database resource ids |
| mariadb\_databases | Map of databases infos |
| mariadb\_databases\_names | List of databases names |
| mariadb\_firewall\_rules | Map of mariadb created rules |
| mariadb\_fqdn | FQDN of the mariadb server |
| mariadb\_server\_id | mariadb server ID |
| mariadb\_server\_name | mariadb server name |
| mariadb\_vnet\_rules | The map of all vnet rules |
| terraform\_module | Information about this Terraform module |
<!-- END_TF_DOCS -->
## Related documentation

Microsoft Azure documentation: [docs.microsoft.com/fr-fr/azure/mariadb/overview](https://docs.microsoft.com/fr-fr/azure/mariadb/overview)
