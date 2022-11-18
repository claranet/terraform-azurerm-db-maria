locals {
  # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)

  server_name = coalesce(lower(var.custom_server_name), data.azurecaf_name.mariadb.result)
}
