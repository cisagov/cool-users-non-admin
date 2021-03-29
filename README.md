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
   variables (see [Inputs](#Inputs) below for details):

   ```hcl
   users = [
     "firstname1.lastname1",
     "firstname2.lastname2",
     "firstname3.lastname3",
   ]
   ```

1. Run the command `terraform init`.
1. Run the command `terraform apply
   -var-file=<workspace_name>.tfvars`.

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 3.0 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.0 |
| aws.users | ~> 3.0 |
| terraform | n/a |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws_region | The AWS region where the non-global resources are to be provisioned (e.g. "us-east-1"). | `string` | `us-east-1` | no |
| non_self_admin_users | A list containing the usernames of non-admin users that are not allowed to administer their own accounts.  Example: [ "service-account1", "service-account2", "service-account3" ] | `list(string)` | `[]` | no |
| tags | Tags to apply to all AWS resources created | `map(string)` | `{}` | no |
| users | A map whose keys are the usernames of each non-admin user and whose values are a map containing supported user attributes.  The only currently-supported attribute is "require_mfa" (boolean).  Example: { "firstname1.lastname1" = { "require_mfa" = false }, "firstname2.lastname2" = { "require_mfa" = true }, "firstname3.lastname3" = { "require_mfa" = false } } | `map(map(string))` | n/a | yes |

## Outputs ##

No output.

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
