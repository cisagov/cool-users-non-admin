# ------------------------------------------------------------------------------
# Create the IAM role that allows access to the Billing policy in the
# Master account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "master_financialaudit_role_assume_role_doc" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${var.users_account_id}:root",
      ]
    }
  }
}

resource "aws_iam_role" "master_financialaudit_role" {
  provider           = aws.master
  assume_role_policy = data.aws_iam_policy_document.master_financialaudit_role_assume_role_doc.json
  description        = var.master_financialaudit_role_description
  name               = var.master_financialaudit_role_name
  tags               = var.tags
}

# Attach (standard AWS-defined) Billing policy to the role
resource "aws_iam_role_policy_attachment" "billing_policy_attachment" {
  provider   = aws.master
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
  role       = aws_iam_role.master_financialaudit_role.name
}
