# v6.0.1 - 2022-10-28

Fixed
  * AZ-883: Fix variables descriptions, cleanup for latest `terraform-linters` rules

# v6.0.0 - 2022-07-01

Breaking
  * AZ-717: Require Terraform 1.1+
  * AZ-717: Bump AzureRM provider version to `v3.0+`
  * AZ-762: Externalize `mysql-users` module in a dedicated repo (to create admin users per database)

# v5.0.1 - 2022-06-10

Added
  * AZ-770: Add Terraform module info in output

# v5.0.0 - 2022-05-13

Breaking
  * AZ-515: Option to use Azure CAF naming provider to name resources
  * AZ-515: Require Terraform 0.13+

Added
  * AZ-589: Add `diagnostic settings` module (latest v5.0.0)
  * AZ-615: Add an option to enable or disable default tags
  * AZ-262: Allow users creation that match created databases
  * AZ-262: Bump minimum version of AzureRM provider to `v2.42`, add MySQL provider

Changed
  * AZ-262: Default administrator login `dbadmin`
  * AZ-262: Output of DB name/id are now a list
  * AZ-572: Revamp examples and improve CI

# v4.0.1 - 2021-08-27

Changed
  * [GITHUB-1](https://github.com/claranet/terraform-azurerm-db-maria/pull/1): Update documentation to reflect current code and Azure MariaDB allowed options.
  * AZ-532: Revamp README with latest `terraform-docs` tool

# v4.0.0 - 2021-01-18

Changed
  * AZ-398: Force lowercase on default generated name

Updated
  * AZ-273: Module now compatible terraform `v0.13+`

# v3.0.0 - 2020-07-27

Breaking
  * AZ-198: Upgrade AzureRM 2.0

# v2.0.0 - 2020-07-03

Added
  * AZ-20: Azure MariaDB Server - First Release
