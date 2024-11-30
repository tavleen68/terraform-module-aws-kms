## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.key_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [aws_ssm_parameter.kms_key_arns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Additional resource tags to be applied to all the resources created | `map(string)` | `{}` | no |
| <a name="input_deletion_window_in_days"></a> [deletion\_window\_in\_days](#input\_deletion\_window\_in\_days) | number of days to delete the key | `number` | n/a | yes |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | enable the rotation of keys | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | namespace to segregate the resources from other environment and used in the naming convention | `string` | `null` | no |
| <a name="input_key_usage"></a> [key\_usage](#input\_key\_usage) | key usage,allowed values are ENCRYPT\_DECRYPT, SIGN\_VERIFY, or GENERATE\_VERIFY\_MAC | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="input_keys_specs"></a> [keys\_specs](#input\_keys\_specs) | List of specifications for creating KMS keys | <pre>list(object({<br>    Name        = string<br>    policy_file = string<br>    # add_policy  = bool<br>  }))</pre> | n/a | yes |
| <a name="input_multi_region"></a> [multi\_region](#input\_multi\_region) | Indicates whether the KMS key is a multi-Region | `bool` | `false` | no |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | the organization name to be used for naming convention | `string` | `null` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | the project name to be used for naming convention | `string` | `null` | no |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | the region name to be used for naming convention | `string` | `null` | no |
| <a name="input_resource_desc"></a> [resource\_desc](#input\_resource\_desc) | the resource desc to be used for naming convention | `string` | `null` | no |
| <a name="input_resource_name"></a> [resource\_name](#input\_resource\_name) | the resource name to be used for naming convention | `string` | `null` | no |
| <a name="input_usage"></a> [usage](#input\_usage) | Purpose of the KMS key | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kms_keys"></a> [kms\_keys](#output\_kms\_keys) | n/a |
| <a name="output_ssm_parameter_names"></a> [ssm\_parameter\_names](#output\_ssm\_parameter\_names) | n/a |
