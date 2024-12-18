output "initial_passwords" {
  description = "The initial password for each user, which must be changed at first login."
  value       = { for k, v in aws_iam_user_login_profile.users : k => v.password }
}
