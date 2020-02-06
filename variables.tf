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
  description = "A map containing the usernames of each non-admin user and a list of roles assigned to that user.  Example: { 'firstname1.lastname1' = { 'roles' = [ 'financial_audit', 'security_audit' ] },  'firstname2.lastname2' = { 'roles' = [ 'security_audit' ] } }"
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

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"
  default     = {}
}
