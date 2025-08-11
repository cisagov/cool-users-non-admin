# cool-users-non-admin #

[![GitHub Build Status](https://github.com/cisagov/cool-users-non-admin/workflows/build/badge.svg)](https://github.com/cisagov/cool-users-non-admin/actions)

This project is used to manage IAM user accounts for non-admin users.
All admin users are set up in the
[`cool-accounts`](https://github.com/cisagov/cool-accounts) repository
(in the [`users` subdirectory](https://github.com/cisagov/cool-accounts/users)).

## Pre-requisites ##

Your "users" provider must have AWS permissions to provision users and attach
policies to them.  We recommend creating your Users account via the
[`cool-accounts`](https://github.com/cisagov/cool-accounts) repository.

## Usage ##

1. Create a Terraform workspace (if you haven't already done so) by running
   `terraform workspace new <workspace_name>`
1. Create a `<workspace_name>.tfvars` file with all of the required
   variables (see [Inputs](#inputs) below for details):

   ```hcl
   users = {
     "firstname1.lastname1" = { "console_access" = true, "require_mfa" = false, "self_managed" = true },
     "firstname2.lastname2" = { "console_access" = true, "require_mfa" = true, "self_managed" = true },
     "firstname3.lastname3" = { "console_access" = false, "require_mfa" = false, "self_managed" = true },
     "service-account1"     = { "console_access" = false, "require_mfa" = false, "self_managed" = false },
   }
   ```

1. Run the command `terraform init`.
1. Run the command `terraform apply
   -var-file=<workspace_name>.tfvars`.

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.1 |
| aws | ~> 6.7 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 6.7 |
| aws.users | ~> 6.7 |
| terraform | n/a |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_user.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_login_profile.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [aws_iam_user_policy_attachment.self_managed_creds_with_mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.self_managed_creds_without_mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [terraform_remote_state.users](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region where the non-global resources are to be provisioned (e.g. "us-east-1"). | `string` | `"us-east-1"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |
| terraform\_state\_bucket | The name of the S3 bucket where Terraform state is stored. | `string` | n/a | yes |
| users | A map whose keys are the usernames of each non-admin user and whose values are a map containing supported user attributes.  The currently-supported attributes are "console\_access" (boolean), "require\_mfa" (boolean), and "self\_managed" (boolean).  Example: { "firstname1.lastname1" = { "console\_access" = true, "require\_mfa" = false, "self\_managed" = true }, "firstname2.lastname2" = { "console\_access" = true, "require\_mfa" = true, "self\_managed" = true }, "firstname3.lastname3" = { "console\_access" = false, "require\_mfa" = false, "self\_managed" = true }, "service-account1" = { "console\_access" = false, "require\_mfa" = false, "self\_managed" = false } } | `map(object({ console_access = bool, require_mfa = bool, self_managed = bool }))` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| initial\_passwords | A map whose keys are the usernames of each non-admin user and whose values are the initial password (which must be changed at first login) for that user. |
<!-- END_TF_DOCS -->

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is only the main directory.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
