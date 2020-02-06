# An IAM group for financial_audit users
resource "aws_iam_group" "financial_audit_users" {
  name = var.financial_audit_users_group_name
}

# An IAM group for security_audit users
resource "aws_iam_group" "security_audit_users" {
  name = var.security_audit_users_group_name
}
