# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "users" {
  type        = map(map(string))
  description = "A map whose keys are the usernames of each non-admin user and whose values are a map containing supported user attributes.  The currently-supported attributes are \"require_mfa\" (boolean) and \"self_managed\" (boolean).  Example: { \"firstname1.lastname1\" = { \"require_mfa\" = false, \"self_managed\" = true }, \"firstname2.lastname2\" = { \"require_mfa\" = true, \"self_managed\" = true }, \"firstname3.lastname3\" = { \"require_mfa\" = false, \"self_managed\" = true }, \"service-account1\" = { \"require_mfa\" = false, \"self_managed\" = false } }"
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

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}
