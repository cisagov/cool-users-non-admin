output "initial_passwords" {
  description = "A map whose keys are the usernames of each non-admin user and whose values are the initial password (which must be changed at first login) for that user."
  sensitive   = true
  value       = { for k, v in aws_iam_user_login_profile.users : k => v.password }
}
