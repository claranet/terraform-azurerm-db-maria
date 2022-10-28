variable "client_name" {
  description = "Client name/account used in naming."
  type        = string
}

variable "environment" {
  description = "Project/Application environment."
  type        = string
}

variable "stack" {
  description = "Project/Application stack name."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the application ressource group."
  type        = string
}

variable "location" {
  description = "Azure region to use."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "administrator_login" {
  description = "MariaDB administrator login."
  type        = string
  default     = "dbadmin"
}

variable "administrator_password" {
  description = "MariaDB administrator password. Auto-generated if empty. Strong Password: https://docs.microsoft.com/en-us/sql/relational-databases/security/strong-passwords?view=sql-server-2017"
  type        = string
  default     = ""
}

variable "vnet_rules" {
  description = "Map of VNet rules to create (keys are rule names, values are Subnet IDs)."
  type        = map(string)
  default     = {}
}

variable "authorized_cidrs" {
  description = "Map of authorized CIDRs (keys are rule names)."
  type        = map(string)
  default     = {}

  validation {
    condition     = var.authorized_cidrs == null || var.authorized_cidrs == {} || alltrue([for n, cidr in var.authorized_cidrs : length(regexall("^([0-9]{1,3}\\.){3}[0-9]{1,3}(\\/([0-9]|[1-2][0-9]|3[0-2]))?$", cidr)) > 0])
    error_message = "The `authorized_cidrs` values must be in a valid CIDR format."
  }
}

variable "tier" {
  description = "Tier for MariaDB server SKU: https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#sku_name Possible values are: `GeneralPurpose`, `Basic`, `MemoryOptimized`"
  type        = string
  default     = "GeneralPurpose"
}

variable "capacity" {
  description = "Capacity for MariaDB server SKU: https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#sku_name"
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

variable "mariadb_configurations" {
  description = "MariaDB configurations to enable."
  type        = map(string)
  default     = {}
}

variable "mariadb_version" {
  description = "Specifies the version of MariaDB to use. Possible values are `10.2` and `10.3`"
  type        = string
  default     = "10.2"
}

variable "force_ssl" {
  description = "Specifies if SSL should be enforced on connections."
  type        = bool
  default     = true
}

variable "databases_charset" {
  description = "Specifies the charset for each MariaDB Database: https://mariadb.com/kb/en/library/setting-character-sets-and-collations/"
  type        = map(string)
  default     = {}
}

variable "databases_collation" {
  description = "Specifies the collation for each MariaDB Database: https://mariadb.com/kb/en/library/setting-character-sets-and-collations/"
  type        = map(string)
  default     = {}
}
