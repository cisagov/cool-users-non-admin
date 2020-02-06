# Put financial_audit users in the appropriate group
resource "aws_iam_user_group_membership" "financial_audit" {
  for_each = { for username, attributes in var.users : username => "" if contains(attributes["roles"], "financial_audit") }

  user = aws_iam_user.users[each.key].name

  groups = [
    aws_iam_group.financial_audit_users.name
  ]
}

# Put security_audit users in the appropriate group
resource "aws_iam_user_group_membership" "security_audit" {
  for_each = { for username, attributes in var.users : username => "" if contains(attributes["roles"], "security_audit") }

  user = aws_iam_user.users[each.key].name

  groups = [
    aws_iam_group.security_audit_users.name
  ]
}
