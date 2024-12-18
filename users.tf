# The non-admin users being created
resource "aws_iam_user" "users" {
  provider = aws.users

  for_each = toset(keys(var.users))

  name = each.key
}

# The login profile for each user; note that the user's initial console
# password is set here, and the user is required to change it at first login.
resource "aws_iam_user_login_profile" "users" {
  provider = aws.users

  for_each = toset(keys(var.users))

  password_reset_required = true
  user                    = aws_iam_user.users[each.key].name

  lifecycle {
    # Required so that Terraform doesn't reset the password if the user login
    # profile was created outside of Terraform (password_length) or after the
    # user has changed their initial password (password_reset_required).
    ignore_changes = [
      password_length,
      password_reset_required
    ]
  }
}

# Attach the self-administration (with MFA required) policy to each user
# where self_managed is true and require_mfa is true
resource "aws_iam_user_policy_attachment" "self_managed_creds_with_mfa" {
  provider = aws.users

  # Ensure that the user exists before attempting to attach the
  # policy.  Ideally the depends_on could live inside the scope of the
  # for_each, so that we could depend only on the specific user that
  # this policy attachment references, but that is not possible;
  # hence, we must depend on _all_ users.  The effect is the same,
  # although getting there is less efficient since _all_ the users are
  # created before _any_ policy attachments.
  depends_on = [aws_iam_user.users]

  for_each = { for k, v in var.users : k => v if v["self_managed"] && v["require_mfa"] }

  policy_arn = data.terraform_remote_state.users.outputs.selfmanagedcredswithmfa_policy.arn
  user       = each.key
}

# Attach the self-administration (without MFA required) policy to each user
# where self_managed is true and require_mfa is false
resource "aws_iam_user_policy_attachment" "self_managed_creds_without_mfa" {
  provider = aws.users

  # Ensure that the user exists before attempting to attach the
  # policy.  Ideally the depends_on could live inside the scope of the
  # for_each, so that we could depend only on the specific user that
  # this policy attachment references, but that is not possible;
  # hence, we must depend on _all_ users.  The end result is the same,
  # although getting there is less efficient since _all_ the users are
  # created before _any_ policy attachments.
  depends_on = [aws_iam_user.users]

  for_each = { for k, v in var.users : k => v if v["self_managed"] && !v["require_mfa"] }

  policy_arn = data.terraform_remote_state.users.outputs.selfmanagedcredswithoutmfa_policy.arn
  user       = each.key
}
