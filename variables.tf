# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "users" {
  # Currently-defined roles: financial_audit, security_audit
  description = "A map containing the usernames of each non-admin user and a list of roles assigned to that user.  Example: { \"firstname1.lastname1\" = { \"roles\" = [ \"financial_audit\", \"security_audit\" ] },  \"firstname2.lastname2\" = { \"roles\" = [ \"security_audit\" ] } }"
  type        = map
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region where the non-global resources are to be provisioned (e.g. \"us-east-1\")."
  default     = "us-east-1"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"
  default     = {}
}
