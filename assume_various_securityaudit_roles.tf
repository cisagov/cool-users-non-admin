# IAM policy document that allows assumption of the SecurityAudit role
# in the various accounts.
data "aws_iam_policy_document" "assume_various_securityaudit_roles_doc" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    resources = [
      "arn:aws:iam::${var.audit_account_id}:role/${var.various_securityaudit_role_name}",
      "arn:aws:iam::${var.dns_account_id}:role/${var.various_securityaudit_role_name}",
      "arn:aws:iam::${var.images_account_id}:role/${var.various_securityaudit_role_name}",
      "arn:aws:iam::${var.logarchive_account_id}:role/${var.various_securityaudit_role_name}",
      "arn:aws:iam::${var.sharedservices_account_id}:role/${var.various_securityaudit_role_name}",
      "arn:aws:iam::${var.terraform_account_id}:role/${var.various_securityaudit_role_name}"
    ]
  }
}

resource "aws_iam_policy" "assume_various_securityaudit_roles" {
  description = var.assume_various_securityaudit_policy_description
  name        = var.assume_various_securityaudit_policy_name
  policy      = data.aws_iam_policy_document.assume_various_securityaudit_roles_doc.json
}

# Attach the policy to the security audit users group
resource "aws_iam_group_policy_attachment" "assume_various_securityaudit_roles_attachment" {
  group      = aws_iam_group.security_audit_users.name
  policy_arn = aws_iam_policy.assume_various_securityaudit_roles.arn
}

# For SecurityAudit permissions in this (Users) account, we don't
# assume a role, we attach it directly to the group
resource "aws_iam_group_policy_attachment" "securityaudit_policy_attachment" {
  group      = aws_iam_group.security_audit_users.name
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

# Attach our SecurityAuditExtras policy to the group
resource "aws_iam_group_policy_attachment" "securityauditextras_policy_attachment" {
  group      = aws_iam_group.security_audit_users.name
  policy_arn = aws_iam_policy.users_securityauditextras_policy.arn
}
