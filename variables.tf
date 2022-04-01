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

variable "administrator_login" {
  description = "MariaDB administrator login"
  type        = string
}

variable "administrator_password" {
  description = "MariaDB administrator password. Strong Password : https://docs.microsoft.com/en-us/sql/relational-databases/security/strong-passwords?view=sql-server-2017"
  type        = string
}

variable "authorized_cidrs" {
  description = "Map of authorized cidrs, must be provided using remote states cloudpublic/cloudpublic/global/vars/terraform.state"
  type        = map(string)
}

variable "tier" {
  description = "Tier for MariaDB server sku : https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#sku_name Possible values are: GeneralPurpose, Basic, MemoryOptimized"
  type        = string
  default     = "GeneralPurpose"
}

variable "capacity" {
  description = "Capacity for MariaDB server sku : https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#sku_name"
  type        = number
  default     = 4
}

variable "auto_grow_enabled" {
  description = "Enable/Disable auto-growing of the storage."
  type        = bool
  default     = false
}

variable "storage_mb" {
  description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
  type        = number
  default     = 5120
}

variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  type        = number
  default     = 10
}

variable "geo_redundant_backup_enabled" {
  description = "Turn Geo-redundant server backups on/off. Not available for the Basic tier."
  type        = bool
  default     = true
}

variable "mariadb_version" {
  description = "Specifies the version of MariaDB to use. Possible values are 10.2 and 10.3"
  type        = string
  default     = "10.2"
}

variable "force_ssl" {
  description = "Force usage of SSL"
  type        = bool
  default     = true
}

variable "databases_charset" {
  description = "Specifies the Charset for each MariaDB Database : https://mariadb.com/kb/en/library/setting-character-sets-and-collations/"
  type        = map(string)
  default     = {}
}

variable "databases_collation" {
  description = "Specifies the Collation for each MariaDB Database : https://mariadb.com/kb/en/library/setting-character-sets-and-collations/"
  type        = map(string)
  default     = {}
}

variable "vnet_rules" {
  description = "Map of vnet rules to create"
  type        = map(string)
  default     = {}
}

variable "mariadb_configurations" {
  description = "MariaDB configurations to enable"
  type        = map(string)
  default     = {}
}
