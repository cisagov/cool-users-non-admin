# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "terraform_state_bucket" {
  description = "The name of the S3 bucket where Terraform state is stored."
  type        = string
}

variable "users" {
  description = "A map whose keys are the usernames of each non-admin user and whose values are a map containing supported user attributes.  The currently-supported attributes are \"console_access\" (boolean), \"require_mfa\" (boolean), and \"self_managed\" (boolean).  Example: { \"firstname1.lastname1\" = { \"console_access\" = true, \"require_mfa\" = false, \"self_managed\" = true }, \"firstname2.lastname2\" = { \"console_access\" = true, \"require_mfa\" = true, \"self_managed\" = true }, \"firstname3.lastname3\" = { \"console_access\" = false, \"require_mfa\" = false, \"self_managed\" = true }, \"service-account1\" = { \"console_access\" = false, \"require_mfa\" = false, \"self_managed\" = false } }"
  nullable    = false
  type        = map(object({ console_access = bool, require_mfa = bool, self_managed = bool }))
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region where the non-global resources are to be provisioned (e.g. \"us-east-1\")."
  nullable    = false
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  nullable    = false
  type        = map(string)
}
