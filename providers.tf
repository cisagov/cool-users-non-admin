# Default provider is for the Users account
provider "aws" {
  region  = var.aws_region
  profile = "cool-users-provisionaccount"
}

provider "aws" {
  alias   = "audit"
  profile = "cool-audit-provisionaccount"
  region  = var.aws_region
}

provider "aws" {
  alias   = "dns"
  profile = "cool-dns-provisionaccount"
  region  = var.aws_region
}

provider "aws" {
  alias   = "images"
  profile = "cool-images-provisionaccount"
  region  = var.aws_region
}

provider "aws" {
  alias   = "logarchive"
  profile = "cool-logarchive-provisionaccount"
  region  = var.aws_region
}

provider "aws" {
  alias   = "master"
  profile = "cool-master-provisionaccount"
  region  = var.aws_region
}

provider "aws" {
  alias   = "sharedservices"
  profile = "cool-sharedservices-provisionaccount"
  region  = var.aws_region
}

provider "aws" {
  alias   = "terraform"
  profile = "cool-terraform-provisionaccount"
  region  = var.aws_region
}
