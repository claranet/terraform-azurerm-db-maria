output "terraform_module" {
  description = "Information about this Terraform module"
  value = {
    name       = "db-maria"
    provider   = "azurerm"
    maintainer = "claranet"
  }
}
