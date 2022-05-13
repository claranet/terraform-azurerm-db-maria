# MySQL user module

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| mysql | >= 1.9 |
| random | >= 3.0 |

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
| database | Database name | `string` | n/a | yes |
| host | User Host | `string` | `"%"` | no |
| password | Password if not generated | `string` | `null` | no |
| privileges | List of privileges | `list(any)` | <pre>[<br>  "ALL"<br>]</pre> | no |
| user | User name | `string` | n/a | yes |
| user\_suffix\_enabled | Append `_user` suffix | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| password | Password |
| user | User |
<!-- END_TF_DOCS -->