variable "custom_server_name" {
  description = "Specifies a custom name for the Mariadb Server. Changing this forces a new resource to be created."
  default     = ""
}

variable "location" {
  description = "Azure region in which the web app will be hosted"
}

variable "location_short" {
  description = "Azure region trigram"
}

variable "environment" {
  description = "Name of application's environnement"
}

variable "stack" {
  description = "Name of application stack"
}

variable "client_name" {
  description = "Name of client"
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
}

variable "sql_user" {
  description = "Sql username"
}

variable "sql_pass" {
  description = "Strong Password : https://docs.microsoft.com/en-us/sql/relational-databases/security/strong-passwords?view=sql-server-2017"
}

variable "extra_tags" {
  description = "Extra tags to add"
  type        = "map"
  default     = {}
}

variable "server_sku" {
  type = "map"

  default = {
    name     = "GP_Gen5_2"
    capacity = 2
    tier     = "GeneralPurpose"
    family   = "Gen5"
  }

  description = "Server class : https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#sku"
}

variable "server_storage_profile" {
  type = "map"

  default = {
    storage_mb            = 5120
    backup_retention_days = 10
    geo_redundant_backup  = "Disabled"
  }

  description = "Storage configuration : https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#storage_profile"
}

variable "db_names" {
  description = "List of databases names"
  type        = "list"
}

variable "mariadb_version" {
  default     = "10.2"
  description = "Valid value is 10.2. https://www.terraform.io/docs/providers/azurerm/r/mariadb_server.html#version"
}

variable "mariadb_ssl_enforcement" {
  default     = "Disabled"
  description = "Possible values are Enforced and Disabled"
}

variable "db_charset" {
  type        = "map"
  description = "Specifies the Charset for each MariaDB Database : https://mariadb.com/kb/en/library/setting-character-sets-and-collations/"
}

variable "db_collation" {
  type        = "map"
  description = "Specifies the Collation for each MariaDB Database : https://mariadb.com/kb/en/library/setting-character-sets-and-collations/"
}

variable "include_firewall_rule" {
  description = "Set to true or false to create or not a firewall rule"
  type        = "string"
  default     = "false"
}

variable "firewall_rule" {
  description = "Firewall rule to allow IPs to connect to the databases."
  type        = "map"
  default     = {}
}

variable "include_vnet_rule" {
  description = "Set to true or false to create or not a vnet rule"
  type        = "string"
  default     = "false"
}

variable "vnet_rule" {
  description = "Vnet rule to allow communications from every node that is on a given subnet."
  type        = "map"
  default     = {}
}
