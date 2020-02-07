# IAM policy document that allows assumption of the FinancialAudit role
# in the Master account.
data "aws_iam_policy_document" "assume_master_financialaudit_role_doc" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    resources = [
      "arn:aws:iam::${var.master_account_id}:role/${var.master_financialaudit_role_name}"
    ]
  }
}

resource "aws_iam_policy" "assume_master_financialaudit_role" {
  description = var.assume_master_financialaudit_policy_description
  name        = var.assume_master_financialaudit_policy_name
  policy      = data.aws_iam_policy_document.assume_master_financialaudit_role_doc.json
}

# Attach the policy to the financial audit users group
resource "aws_iam_group_policy_attachment" "assume_master_financialaudit_role_attachment" {
  group      = aws_iam_group.financial_audit_users.name
  policy_arn = aws_iam_policy.assume_master_financialaudit_role.arn
}
