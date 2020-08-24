# ------------------------------------------------------------------------------
# Create the IAM roles that allow access to the SecurityAudit policy in
# various accounts.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "securityaudit_role_assume_role_doc" {
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

resource "aws_iam_role" "audit_securityaudit_role" {
  provider           = aws.audit
  assume_role_policy = data.aws_iam_policy_document.securityaudit_role_assume_role_doc.json
  description        = var.various_securityaudit_role_description
  name               = var.various_securityaudit_role_name
  tags               = var.tags
}

# Attach (standard AWS-defined) SecurityAudit policy to the role
resource "aws_iam_role_policy_attachment" "audit_securityaudit_policy_attachment" {
  provider   = aws.audit
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
  role       = aws_iam_role.audit_securityaudit_role.name
}

# Attach our SecurityAuditExtras policy to the role
resource "aws_iam_role_policy_attachment" "audit_securityauditextras_policy_attachment" {
  provider   = aws.audit
  policy_arn = aws_iam_policy.audit_securityauditextras_policy.arn
  role       = aws_iam_role.audit_securityaudit_role.name
}

resource "aws_iam_role" "dns_securityaudit_role" {
  provider           = aws.dns
  assume_role_policy = data.aws_iam_policy_document.securityaudit_role_assume_role_doc.json
  description        = var.various_securityaudit_role_description
  name               = var.various_securityaudit_role_name
  tags               = var.tags
}

# Attach (standard AWS-defined) SecurityAudit policy to the role
resource "aws_iam_role_policy_attachment" "dns_securityaudit_policy_attachment" {
  provider   = aws.dns
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
  role       = aws_iam_role.dns_securityaudit_role.name
}

# Attach our SecurityAuditExtras policy to the role
resource "aws_iam_role_policy_attachment" "dns_securityauditextras_policy_attachment" {
  provider   = aws.dns
  policy_arn = aws_iam_policy.dns_securityauditextras_policy.arn
  role       = aws_iam_role.dns_securityaudit_role.name
}

resource "aws_iam_role" "images_securityaudit_role" {
  provider           = aws.images
  assume_role_policy = data.aws_iam_policy_document.securityaudit_role_assume_role_doc.json
  description        = var.various_securityaudit_role_description
  name               = var.various_securityaudit_role_name
  tags               = var.tags
}

# Attach (standard AWS-defined) SecurityAudit policy to the role
resource "aws_iam_role_policy_attachment" "images_securityaudit_policy_attachment" {
  provider   = aws.images
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
  role       = aws_iam_role.images_securityaudit_role.name
}

# Attach our SecurityAuditExtras policy to the role
resource "aws_iam_role_policy_attachment" "images_securityauditextras_policy_attachment" {
  provider   = aws.images
  policy_arn = aws_iam_policy.images_securityauditextras_policy.arn
  role       = aws_iam_role.images_securityaudit_role.name
}

resource "aws_iam_role" "logarchive_securityaudit_role" {
  provider           = aws.logarchive
  assume_role_policy = data.aws_iam_policy_document.securityaudit_role_assume_role_doc.json
  description        = var.various_securityaudit_role_description
  name               = var.various_securityaudit_role_name
  tags               = var.tags
}

# Attach (standard AWS-defined) SecurityAudit policy to the role
resource "aws_iam_role_policy_attachment" "logarchive_securityaudit_policy_attachment" {
  provider   = aws.logarchive
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
  role       = aws_iam_role.logarchive_securityaudit_role.name
}

# Attach our SecurityAuditExtras policy to the role
resource "aws_iam_role_policy_attachment" "logarchive_securityauditextras_policy_attachment" {
  provider   = aws.logarchive
  policy_arn = aws_iam_policy.logarchive_securityauditextras_policy.arn
  role       = aws_iam_role.logarchive_securityaudit_role.name
}

resource "aws_iam_role" "sharedservices_securityaudit_role" {
  provider           = aws.sharedservices
  assume_role_policy = data.aws_iam_policy_document.securityaudit_role_assume_role_doc.json
  description        = var.various_securityaudit_role_description
  name               = var.various_securityaudit_role_name
  tags               = var.tags
}

# Attach (standard AWS-defined) SecurityAudit policy to the role
resource "aws_iam_role_policy_attachment" "sharedservices_securityaudit_policy_attachment" {
  provider   = aws.sharedservices
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
  role       = aws_iam_role.sharedservices_securityaudit_role.name
}

# Attach our SecurityAuditExtras policy to the role
resource "aws_iam_role_policy_attachment" "sharedservices_securityauditextras_policy_attachment" {
  provider   = aws.sharedservices
  policy_arn = aws_iam_policy.sharedservices_securityauditextras_policy.arn
  role       = aws_iam_role.sharedservices_securityaudit_role.name
}

resource "aws_iam_role" "terraform_securityaudit_role" {
  provider           = aws.terraform
  assume_role_policy = data.aws_iam_policy_document.securityaudit_role_assume_role_doc.json
  description        = var.various_securityaudit_role_description
  name               = var.various_securityaudit_role_name
  tags               = var.tags
}

# Attach (standard AWS-defined) SecurityAudit policy to the role
resource "aws_iam_role_policy_attachment" "terraform_securityaudit_policy_attachment" {
  provider   = aws.terraform
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
  role       = aws_iam_role.terraform_securityaudit_role.name
}

# Attach our SecurityAuditExtras policy to the role
resource "aws_iam_role_policy_attachment" "terraform_securityauditextras_policy_attachment" {
  provider   = aws.terraform
  policy_arn = aws_iam_policy.terraform_securityauditextras_policy.arn
  role       = aws_iam_role.terraform_securityaudit_role.name
}
