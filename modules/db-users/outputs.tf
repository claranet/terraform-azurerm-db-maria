output "user" {
  value       = mysql_user.user.user
  description = "User"
}

output "password" {
  value       = mysql_user.user.plaintext_password
  sensitive   = true
  description = "Password"
}
