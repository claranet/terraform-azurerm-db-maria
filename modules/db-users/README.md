# MySQL user module

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| mysql | >= 1.9 |
| random | >= 1.9 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [mysql_grant.role](https://registry.terraform.io/providers/terraform-providers/mysql/latest/docs/resources/grant) | resource |
| [mysql_user.user](https://registry.terraform.io/providers/terraform-providers/mysql/latest/docs/resources/user) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| database | n/a | `string` | n/a | yes |
| enable\_user\_suffix | n/a | `bool` | `false` | no |
| host | n/a | `string` | `"%"` | no |
| password | n/a | `string` | `null` | no |
| privileges | n/a | `list(any)` | <pre>[<br>  "ALL"<br>]</pre> | no |
| user | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| password | Mysql database password |
| user | Mysql database user |
<!-- END_TF_DOCS -->