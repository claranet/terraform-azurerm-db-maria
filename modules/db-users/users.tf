resource "random_password" "password" {
  special = false
  length  = 32
}

resource "mysql_user" "user" {
  # provider = mysql.create-users

  user               = var.enable_user_suffix ? format("%s_user", var.user) : var.user
  plaintext_password = coalesce(var.password, random_password.password.result)
  host               = var.host
}

resource "mysql_grant" "role" {
  # provider = mysql.create-users

  user       = var.enable_user_suffix ? format("%s_user", var.user) : var.user
  host       = var.host
  database   = var.database
  privileges = var.privileges

  depends_on = [mysql_user.user]
}
