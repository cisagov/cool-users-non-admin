# cool-users-non-admin #

[![GitHub Build Status](https://github.com/cisagov/cool-users-non-admin/workflows/build/badge.svg)](https://github.com/cisagov/cool-users-non-admin/actions)

This project is used to manage IAM user accounts and group membership for
non-admin users.  All admin users are set up in the
[`cool-accounts`](https://github.com/cisagov/cool-accounts) repository
(in the [`users` subdirectory](https://github.com/cisagov/cool-accounts/users)).

## Usage ##

TBD

## Examples ##

TBD

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| audit_account_id | The ID of the Audit account, which contains a role that can be assumed to provision AWS resources in that account | string | | yes |
| audit_provisionaccount_role_name | The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Audit account | string | `ProvisionAccount` | no |
| aws_region | The AWS region to deploy into (e.g. us-east-1) | string | | yes |
| dns_account_id | The ID of the DNS account, which contains a role that can be assumed to provision AWS resources in that account | string | | yes |
| dns_provisionaccount_role_name | The name of the IAM role that allows sufficient permissions to provision all AWS resources in the DNS account | string | `ProvisionAccount` | no |
| financial_audit_users_group_name | The name of the group to be created for financial audit users | string | `financial_auditors` | no |
| images_account_id | The ID of the Images account, which contains a role that can be assumed to provision AWS resources in that account | string | | yes |
| images_provisionaccount_role_name | The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Images account | string | `ProvisionAccount` | no |
| logarchive_account_id | The ID of the Log Archive account, which contains a role that can be assumed to provision AWS resources in that account | string | | yes |
| logarchive_provisionaccount_role_name | The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Log Archive account | string | `ProvisionAccount` | no |
| master_account_id | The ID of the Master account, which contains a role that can be assumed to provision AWS resources in that account | string | | yes |
| master_provisionaccount_role_name | The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Master account | string | `ProvisionAccount` | no |
| security_audit_users_group_name | The name of the group to be created for security audit users | string | `security_auditors` | no |
| sharedservices_account_id | The ID of the Shared Services account, which contains a role that can be assumed to provision AWS resources in that account | string | | yes |
| sharedservices_provisionaccount_role_name | The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Shared Services account | string | `ProvisionAccount` | no |
| tags | Tags to apply to all AWS resources Terraform Services account, which contains a role that can be assumed to provision AWS resources in that account | string | | yes |
| terraform_provisionaccount_role_name | The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Terraform account | string | `ProvisionAccount` | no |
| users | A map containing the usernames of each non-admin user and a list of roles assigned to that user.  Example: { 'firstname1.lastname1' = { 'roles' = [ 'financial_audit', 'security_audit' ] },  'firstname2.lastname2' = { 'roles' = [ 'security_audit' ] } } | map | | yes |
| users_account_id | The ID of the Users account, which contains a role that can be assumed to provision AWS resources in that account | string | | yes |
| users_provisionaccount_role_name | The name of the IAM role that allows sufficient permissions to provision all AWS resources in the Users account | string | `ProvisionAccount` | no |

## Outputs ##

TBD

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for
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
