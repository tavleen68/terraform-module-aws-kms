locals {
  ssm_id = "/${var.org_name}/${var.region_name}/${var.environment}/${var.project_name}/kms"
}

resource "aws_ssm_parameter" "kms_key_arns" {
  count = length(var.keys_specs)
  name  = "${local.ssm_id}/${var.keys_specs[count.index].Name}/arn"
  type  = "String"
  value = aws_kms_key.this[count.index].arn
}

output "ssm_parameter_names" {
  value = [for index, key_spec in var.keys_specs : aws_ssm_parameter.kms_key_arns[index].name]
}