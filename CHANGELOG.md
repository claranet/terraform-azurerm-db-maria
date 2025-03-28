## 7.0.1 (2025-02-21)

### Documentation

* update example 9411e17

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.4 774337b
* **deps:** update dependency opentofu to v1.8.6 26cb3af
* **deps:** update dependency opentofu to v1.8.8 eaa91a6
* **deps:** update dependency opentofu to v1.9.0 b81b990
* **deps:** update dependency pre-commit to v4.1.0 1477e03
* **deps:** update dependency tflint to v0.54.0 7e15d68
* **deps:** update dependency tflint to v0.55.0 aa11351
* **deps:** update dependency trivy to v0.57.1 84cc7f9
* **deps:** update dependency trivy to v0.58.1 5b5a2af
* **deps:** update dependency trivy to v0.58.2 c2c92b6
* **deps:** update dependency trivy to v0.59.1 14cbaae
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.19.0 a29a6fa
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.20.0 99d502c
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.21.0 2ef083d
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.1.0 57d1a28
* **deps:** update tools 5eaa6a1
* **deps:** update tools 7aed563
* **deps:** update tools baee783
* update Github templates 7ad4ca1
* update tflint config for v0.55.0 f492c08

## 7.0.0 (2024-10-11)

### ⚠ BREAKING CHANGES

* **AZ-840:** AzureRM provider v3+ required

### Features

* **AZ-1473:** set default ssl_min_version depending on ssl activation df2f82f
* **AZ-840:** prepare `v7.0` c0ded42

### Documentation

* update README, this module is deprecated c780018

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.3 1246e79
* **deps:** update dependency pre-commit to v4 3f5ae22
* **deps:** update dependency pre-commit to v4.0.1 a64bf1e
* **deps:** update dependency trivy to v0.56.1 7a7593a
* **deps:** update dependency trivy to v0.56.2 3d15d68
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v5 fb15982
* prepare for new examples structure f1d838c
* update examples structure 61ab35b

## 6.3.0 (2024-10-03)

### Features

* use Claranet "azurecaf" provider abbb058

### Documentation

* update README badge to use OpenTofu registry 3d891aa
* update README with `terraform-docs` v0.19.0 cb99940

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.7.0 bb26a96
* **deps:** update dependency opentofu to v1.7.1 1b2112c
* **deps:** update dependency opentofu to v1.7.2 90eebe0
* **deps:** update dependency opentofu to v1.7.3 e639b1e
* **deps:** update dependency opentofu to v1.8.0 9c4c7ff
* **deps:** update dependency opentofu to v1.8.1 f578e40
* **deps:** update dependency opentofu to v1.8.2 19de5b0
* **deps:** update dependency pre-commit to v3.7.1 feff2c4
* **deps:** update dependency pre-commit to v3.8.0 c666e55
* **deps:** update dependency terraform-docs to v0.18.0 4ee2aff
* **deps:** update dependency terraform-docs to v0.19.0 05f801c
* **deps:** update dependency tflint to v0.51.0 8d7af6d
* **deps:** update dependency tflint to v0.51.1 8063884
* **deps:** update dependency tflint to v0.51.2 57549d0
* **deps:** update dependency tflint to v0.52.0 3481d93
* **deps:** update dependency tflint to v0.53.0 e178e48
* **deps:** update dependency trivy to v0.51.0 72c0341
* **deps:** update dependency trivy to v0.51.1 3e8610d
* **deps:** update dependency trivy to v0.51.2 c8d0322
* **deps:** update dependency trivy to v0.51.4 528247f
* **deps:** update dependency trivy to v0.52.0 7961bf1
* **deps:** update dependency trivy to v0.52.1 644090c
* **deps:** update dependency trivy to v0.52.2 44ac599
* **deps:** update dependency trivy to v0.53.0 ecd6917
* **deps:** update dependency trivy to v0.54.1 e3ea3b5
* **deps:** update dependency trivy to v0.55.0 104fbe5
* **deps:** update dependency trivy to v0.55.1 f5bd533
* **deps:** update dependency trivy to v0.55.2 59d8425
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 d7744fd
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 5b911e7
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 1ca98dc
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 a25808d
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.2 bcaff9a
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.3 e399b25
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.93.0 e14bf20
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.0 325114c
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 1a026a9
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 e345500
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 fd4ce99
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 9dbea89
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 95eeb16
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.1 98e79b2

## 6.2.1 (2024-04-26)


### Styles

* **output:** remove unused version from outputs-module a08e8a4


### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] 3ea133b
* **AZ-1391:** update semantic-release config [skip ci] 3e84fa0


### Miscellaneous Chores

* **deps:** add renovate.json 99d8417
* **deps:** enable automerge on renovate 1f5edd9
* **deps:** update dependency trivy to v0.50.2 0eb74c3
* **deps:** update dependency trivy to v0.50.4 524ea31
* **deps:** update renovate.json 750e4ea
* **deps:** update terraform claranet/diagnostic-settings/azurerm to ~> 6.5.0 a11f9cf
* **pre-commit:** update commitlint hook 2705ed3
* **release:** remove legacy `VERSION` file 9eada1a

# v6.2.0 - 2022-11-25

Changed
  * AZ-908: Use the new data source for CAF naming (instead of resource)

# v6.1.0 - 2022-11-10

Added
  * AZ-901: Add variable `public_network_access_enabled`

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
