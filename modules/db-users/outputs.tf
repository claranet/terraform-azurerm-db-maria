output "user" {
  value       = mysql_user.user.user
  description = "Mysql database user"
}

output "password" {
  value       = mysql_user.user.plaintext_password
  description = "Mysql database password"
  sensitive   = true
}
