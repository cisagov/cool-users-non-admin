# Default provider is for the Users account
provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn     = "arn:aws:iam::${var.users_account_id}:role/${var.users_provisionaccount_role_name}"
    session_name = "terraform-non-admin-users"
  }
}

provider "aws" {
  alias  = "audit"
  region = var.aws_region
  assume_role {
    role_arn     = "arn:aws:iam::${var.audit_account_id}:role/${var.audit_provisionaccount_role_name}"
    session_name = "terraform-non-admin-users-audit"
  }
}

provider "aws" {
  alias  = "dns"
  region = var.aws_region
  assume_role {
    role_arn     = "arn:aws:iam::${var.dns_account_id}:role/${var.dns_provisionaccount_role_name}"
    session_name = "terraform-non-admin-users-dns"
  }
}

provider "aws" {
  alias  = "images"
  region = var.aws_region
  assume_role {
    role_arn     = "arn:aws:iam::${var.images_account_id}:role/${var.images_provisionaccount_role_name}"
    session_name = "terraform-non-admin-users-images"
  }
}

provider "aws" {
  alias  = "logarchive"
  region = var.aws_region
  assume_role {
    role_arn     = "arn:aws:iam::${var.logarchive_account_id}:role/${var.logarchive_provisionaccount_role_name}"
    session_name = "terraform-non-admin-users-logarchive"
  }
}

provider "aws" {
  alias  = "master"
  region = var.aws_region
  assume_role {
    role_arn     = "arn:aws:iam::${var.master_account_id}:role/${var.master_provisionaccount_role_name}"
    session_name = "terraform-non-admin-users-master"
  }
}

provider "aws" {
  alias  = "sharedservices"
  region = var.aws_region
  assume_role {
    role_arn     = "arn:aws:iam::${var.sharedservices_account_id}:role/${var.sharedservices_provisionaccount_role_name}"
    session_name = "terraform-non-admin-users-sharedservices"
  }
}

provider "aws" {
  alias  = "terraform"
  region = var.aws_region
  assume_role {
    role_arn     = "arn:aws:iam::${var.terraform_account_id}:role/${var.terraform_provisionaccount_role_name}"
    session_name = "terraform-non-admin-users-terraform"
  }
}
