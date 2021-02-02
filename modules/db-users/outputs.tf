output "user" {
  value = mysql_user.user.user
}

output "password" {
  value = mysql_user.user.plaintext_password
}
