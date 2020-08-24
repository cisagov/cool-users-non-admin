# ------------------------------------------------------------------------------
# Create the IAM policy with additional permissions needed by security
# auditors beyond the standard AWS-defined SecurityAudit policy.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "securityauditextras_doc" {
  statement {
    actions = [
      "logs:GetLogEvents"
    ]
    resources = [
      "arn:aws:logs:*:*:log-group:*:log-stream:*",
    ]
  }

  statement {
    actions = [
      "logs:FilterLogEvents"
    ]
    resources = [
      "arn:aws:logs:*:*:log-group:*",
    ]
  }
}

# Create the SecurityAuditorExtras policy in the Users account
resource "aws_iam_policy" "users_securityauditextras_policy" {
  description = var.securityauditextras_policy_description
  name        = var.securityauditextras_policy_name
  policy      = data.aws_iam_policy_document.securityauditextras_doc.json
}

# Create the SecurityAuditorExtras policy in all other accounts
resource "aws_iam_policy" "audit_securityauditextras_policy" {
  provider    = aws.audit
  description = var.securityauditextras_policy_description
  name        = var.securityauditextras_policy_name
  policy      = data.aws_iam_policy_document.securityauditextras_doc.json
}

resource "aws_iam_policy" "dns_securityauditextras_policy" {
  provider    = aws.dns
  description = var.securityauditextras_policy_description
  name        = var.securityauditextras_policy_name
  policy      = data.aws_iam_policy_document.securityauditextras_doc.json
}

resource "aws_iam_policy" "images_securityauditextras_policy" {
  provider    = aws.images
  description = var.securityauditextras_policy_description
  name        = var.securityauditextras_policy_name
  policy      = data.aws_iam_policy_document.securityauditextras_doc.json
}

resource "aws_iam_policy" "logarchive_securityauditextras_policy" {
  provider    = aws.logarchive
  description = var.securityauditextras_policy_description
  name        = var.securityauditextras_policy_name
  policy      = data.aws_iam_policy_document.securityauditextras_doc.json
}

resource "aws_iam_policy" "sharedservices_securityauditextras_policy" {
  provider    = aws.sharedservices
  description = var.securityauditextras_policy_description
  name        = var.securityauditextras_policy_name
  policy      = data.aws_iam_policy_document.securityauditextras_doc.json
}

resource "aws_iam_policy" "terraform_securityauditextras_policy" {
  provider    = aws.terraform
  description = var.securityauditextras_policy_description
  name        = var.securityauditextras_policy_name
  policy      = data.aws_iam_policy_document.securityauditextras_doc.json
}
