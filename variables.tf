# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "audit_account_id" {
  description = "The ID of the Audit account, which contains a role that can be assumed to provision AWS resources in that account."
}

variable "dns_account_id" {
  description = "The ID of the DNS account, which contains a role that can be assumed to provision AWS resources in that account."
}

variable "images_account_id" {
  description = "The ID of the Images account, which contains a role that can be assumed to provision AWS resources in that account."
}

variable "logarchive_account_id" {
  description = "The ID of the Log Archive account, which contains a role that can be assumed to provision AWS resources in that account."
}

variable "master_account_id" {
  description = "The ID of the Master account, which contains a role that can be assumed to provision AWS resources in that account."
}

variable "sharedservices_account_id" {
  description = "The ID of the Shared Services account, which contains a role that can be assumed to provision AWS resources in that account."
}

variable "terraform_account_id" {
  description = "The ID of the Terraform account, which contains a role that can be assumed to provision AWS resources in that account."
}

variable "users" {
  # Currently-defined roles: financial_audit, security_audit
  description = "A map containing the usernames of each non-admin user and a list of roles assigned to that user.  Example: { \"firstname1.lastname1\" = { \"roles\" = [ \"financial_audit\", \"security_audit\" ] },  \"firstname2.lastname2\" = { \"roles\" = [ \"security_audit\" ] } }"
  type        = map
}

variable "users_account_id" {
  description = "The ID of the Users account, which contains a role that can be assumed to provision AWS resources in that account."
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "assume_master_financialaudit_policy_description" {
  description = "The description to associate with the IAM policy that allows assumption of the role that allows access to the Billing policy in the Master account."
  default     = "Allow assumption of the FinancialAudit role in the Master account."
}

variable "assume_master_financialaudit_policy_name" {
  description = "The name to assign the IAM policy that allows assumption of the role that allows access to the Billing policy in the Master account."
  default     = "Master-AssumeFinancialAudit"
}

variable "assume_various_securityaudit_policy_description" {
  description = "The description to associate with the IAM policy that allows assumption of the role that allows access to the SecurityAudit policy in the various accounts."
  default     = "Allow assumption of the SecurityAudit role in various accounts."
}

variable "assume_various_securityaudit_policy_name" {
  description = "The name to assign the IAM policy that allows assumption of the role that allows access to the SecurityAudit policy in the various accounts."
  default     = "Various-AssumeSecurityAudit"
}

variable "audit_provisionaccount_role_name" {
  description = "The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Audit account."
  default     = "ProvisionAccount"
}

variable "aws_region" {
  description = "The AWS region where the non-global resources are to be provisioned (e.g. \"us-east-1\")."
  default     = "us-east-1"
}

variable "dns_provisionaccount_role_name" {
  description = "The name of the IAM role that allows sufficient permissions to provision all AWS resources in the DNS account."
  default     = "ProvisionAccount"
}

variable "financial_audit_users_group_name" {
  description = "The name of the group to be created for financial audit users."
  default     = "financial_auditors"
}

variable "images_provisionaccount_role_name" {
  description = "The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Images account."
  default     = "ProvisionAccount"
}

variable "logarchive_provisionaccount_role_name" {
  description = "The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Log Archive account."
  default     = "ProvisionAccount"
}

variable "master_financialaudit_role_description" {
  description = "The description to associate with the IAM role that allows access to the Billing policy in the Master account."
  default     = "Allows sufficient access to billing information."
}

variable "master_financialaudit_role_name" {
  description = "The name to assign the IAM role that allows access to the Billing policy in the Master account."
  default     = "FinancialAudit"
}

variable "master_provisionaccount_role_name" {
  description = "The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Master account."
  default     = "ProvisionAccount"
}

variable "security_audit_users_group_name" {
  description = "The name of the group to be created for security audit users."
  default     = "security_auditors"
}

variable "securityauditextras_policy_description" {
  description = "The description to associate with the IAM policy that gives access to additional permissions required by security auditors."
  default     = "Allows access to additional resources required by security auditors."
}

variable "securityauditextras_policy_name" {
  description = "The name to assign the IAM policy that gives access to additional permissions required by security auditors."
  default     = "SecurityAuditExtras"
}

variable "sharedservices_provisionaccount_role_name" {
  description = "The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Shared Services account."
  default     = "ProvisionAccount"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"
  default     = {}
}

variable "terraform_provisionaccount_role_name" {
  description = "The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Terraform account."
  default     = "ProvisionAccount"
}

variable "users_provisionaccount_role_name" {
  description = "The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Users account."
  default     = "ProvisionAccount"
}

variable "various_securityaudit_role_description" {
  description = "The description to associate with the IAM role that allows access to the SecurityAudit policy in various AWS accounts."
  default     = "Allows read-only access to resources for security auditors."
}

variable "various_securityaudit_role_name" {
  description = "The name to assign the IAM role that allows access to the SecurityAudit policy in various AWS accounts."
  default     = "SecurityAudit"
}
