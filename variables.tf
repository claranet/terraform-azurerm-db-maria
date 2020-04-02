variable "client_name" {
  description = "Name of client"
  type        = string
}

variable "environment" {
  description = "Name of application's environnement"
  type        = string
}

variable "stack" {
  description = "Name of application stack"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the application ressource group, herited from infra module"
  type        = string
}

variable "location" {
  description = "Azure location for Key Vault."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "name_prefix" {
  description = "Optional prefix for PostgreSQL server name"
  type        = string
  default     = ""
}

variable "custom_server_name" {
  type        = string
  description = "Custom Server Name identifier"
  default     = ""
}

variable "administrator_login" {
  description = "MariaDB administrator login"
  type        = string
}

variable "administrator_password" {
  description = "MariaDB administrator password. Strong Password : https://docs.microsoft.com/en-us/sql/relational-databases/security/strong-passwords?view=sql-server-2017"
  type        = string
}

variable "extra_tags" {
  description = "Extra tags to add"
  type        = map(string)
  default     = {}
}

variable "authorized_cidrs" {
  type        = map(string)
  description = "Map of authorized cidrs, must be provided using remote states cloudpublic/cloudpublic/global/vars/terraform.state"
}

variable "tier" {
  type        = string
  description = "Tier for MariaDB server sku : https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#sku_name Possible values are: GeneralPurpose, Basic, MemoryOptimized"
  default     = "GeneralPurpose"
}

variable "capacity" {
  type        = number
  description = "Capacity for MariaDB server sku : https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#sku_name"
  default     = 4
}

variable "server_storage_profile" {
  type = map(string)

  default = {
    storage_mb            = 5120
    backup_retention_days = 10
    geo_redundant_backup  = "Disabled"
    auto_grow             = "Disabled"
  }

  description = "Storage configuration : https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#storage_profile"
}

variable "databases_names" {
  description = "List of databases names"
  type        = list(string)
}

variable "mariadb_version" {
  default     = "10.2"
  description = "Specifies the version of MariaDB to use. Possible values are 10.2 and 10.3"
}

variable "force_ssl" {
  type        = bool
  default     = true
  description = "Force usage of SSL"
}

variable "databases_charset" {
  type        = map(string)
  description = "Specifies the Charset for each MariaDB Database : https://mariadb.com/kb/en/library/setting-character-sets-and-collations/"
}

variable "databases_collation" {
  type        = map(string)
  description = "Specifies the Collation for each MariaDB Database : https://mariadb.com/kb/en/library/setting-character-sets-and-collations/"
}

variable "vnet_rules" {
  type        = map(string)
  description = "Map of vnet rules to create"
  default     = {}
}

variable "mariadb_configurations" {
  type        = map(string)
  default     = {}
  description = "MariaDB configurations to enable"
}
