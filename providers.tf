# Default provider is for the Users account
provider "aws" {
  region  = var.aws_region
  profile = "cool-users-provisionaccount"
}
