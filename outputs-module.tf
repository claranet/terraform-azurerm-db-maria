output "terraform_module" {
  description = "Information about this Terraform module"
  value = {
    name       = "db-maria"
    version    = "v5.0.0"
    provider   = "azurerm"
    maintainer = "claranet"
  }
}
