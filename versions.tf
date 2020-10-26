terraform {
  # We want to hold off on 0.13 until we have tested it.
  required_version = "~> 0.12.0"

  # Pin provider(s) to major version currently being used.
  # This helps us avoid unwelcome surprises.
  required_providers {
    aws = "~> 3.0"
  }
}
