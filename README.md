# Azure Mariadb

This feature generates a mariadb server with one or several databases. 

## Requirements

* [AzureRM Terraform provider](https://www.terraform.io/docs/providers/azurerm/) >= 1.31

## Terraform version compatibility
 
| Module version    | Terraform version | AzureRM version |
|-------------------|-------------------|-----------------|
| >= 3.x.x          | 0.12.x            | >= 2.0          |
| >= 2.x.x, < 3.x.x | 0.12.x            | <  2.0          |
| <  2.x.x          | 0.11.x            | <  2.0          |


## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl

module "azure-region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure-region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "db-maria" {
  source  = "claranet/db-mariadb/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  resource_group_name = module.rg.resource_group_name
  location            = module.azure-region.location
  location_short      = module.azure-region.location_short
  environment         = var.environment
  stack               = var.stack

  tier     = "GeneralPurpose"
  capacity = 4

  allowed_cidrs = {
    rule1 = "10.0.0.0/24",
    rule2 = "12.34.56.78/32"
  }

  server_storage_profile = {
    storage_mb            = 5120
    backup_retention_days = 10
    geo_redundant_backup  = "Enabled"
    auto_grow             = "Disabled"
  }

  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password

  force_ssl = true

  databases_names     = ["mydatabase"]
  databases_collation = { mydatabase = "en_US" }
  databases_charset   = { mydatabase = "UTF8" }

  extra_tags = var.extra_tags 
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| administrator\_login | MariaDB administrator login | `string` | n/a | yes |
| administrator\_password | MariaDB administrator password. Strong Password : https://docs.microsoft.com/en-us/sql/relational-databases/security/strong-passwords?view=sql-server-2017 | `string` | n/a | yes |
| authorized\_cidrs | Map of authorized cidrs, must be provided using remote states cloudpublic/cloudpublic/global/vars/terraform.state | `map(string)` | n/a | yes |
| capacity | Capacity for MariaDB server sku : https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#sku_name | `number` | `4` | no |
| client\_name | Name of client | `string` | n/a | yes |
| custom\_server\_name | Custom Server Name identifier | `string` | `""` | no |
| databases\_charset | Specifies the Charset for each MariaDB Database : https://mariadb.com/kb/en/library/setting-character-sets-and-collations/ | `map(string)` | n/a | yes |
| databases\_collation | Specifies the Collation for each MariaDB Database : https://mariadb.com/kb/en/library/setting-character-sets-and-collations/ | `map(string)` | n/a | yes |
| databases\_names | List of databases names | `list(string)` | n/a | yes |
| environment | Name of application's environnement | `string` | n/a | yes |
| extra\_tags | Extra tags to add | `map(string)` | `{}` | no |
| force\_ssl | Force usage of SSL | `bool` | `true` | no |
| location | Azure location for Key Vault. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| mariadb\_configurations | MariaDB configurations to enable | `map(string)` | `{}` | no |
| mariadb\_version | Specifies the version of MariaDB to use. Possible values are 10.2 and 10.3 | `string` | `"10.2"` | no |
| name\_prefix | Optional prefix for PostgreSQL server name | `string` | `""` | no |
| resource\_group\_name | Name of the application ressource group, herited from infra module | `string` | n/a | yes |
| server\_storage\_profile | Storage configuration : https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#storage_profile | `map(string)` | <pre>{<br>  "auto_grow": "Disabled",<br>  "backup_retention_days": 10,<br>  "geo_redundant_backup": "Disabled",<br>  "storage_mb": 5120<br>}</pre> | no |
| stack | Name of application stack | `string` | n/a | yes |
| tier | Tier for MariaDB server sku : https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#sku_name Possible values are: GeneralPurpose, Basic, MemoryOptimized | `string` | `"GeneralPurpose"` | no |
| vnet\_rules | Map of vnet rules to create | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| mariadb\_administrator\_login | Administrator login for mariadb server |
| mariadb\_configurations | The map of all mariadb configurations set |
| mariadb\_database\_ids | The map of all database resource ids |
| mariadb\_databases\_names | Map of databases names |
| mariadb\_firewall\_rules | Map of mariadb created rules |
| mariadb\_fqdn | FQDN of the mariadb server |
| mariadb\_server\_id | mariadb server ID |
| mariadb\_vnet\_rules | The map of all vnet rules |
