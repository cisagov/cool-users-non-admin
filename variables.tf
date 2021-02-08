# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "users" {
  type = list(string)
  # Currently-defined roles: financial_audit, security_audit
  description = "A list containing the usernames of each non-admin user.  Example: [ \"firstname1.lastname1\", \"firstname2.lastname2\", \"firstname3.lastname3\" ]"
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  type        = string
  description = "The AWS region where the non-global resources are to be provisioned (e.g. \"us-east-1\")."
  default     = "us-east-1"
}

variable "non_self_admin_users" {
  type        = list(string)
  description = "A list containing the usernames of non-admin users that are not allowed to administer their own accounts.  Example: [ \"service-account1\", \"service-account2\", \"service-account3\" ]"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"
  default     = {}
}
