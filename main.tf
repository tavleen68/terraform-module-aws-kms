provider "aws" {
  region = var.region_name
}
terraform {
  required_version = ">= 0.16" // Specify the minimum required version
}

locals {
  id = "${var.org_name}-${var.region_name}-${var.environment}-${var.project_name}-${var.resource_name}-${var.resource_desc}"
}

################################################################################
# Key
################################################################################

resource "aws_kms_key" "this" {
  count                   = length(var.keys_specs)
  description             = "KMS key for ${var.keys_specs[count.index].Name}"
  enable_key_rotation     = var.enable_key_rotation
  deletion_window_in_days = var.deletion_window_in_days
  key_usage               = var.key_usage
  multi_region            = var.multi_region
  tags = merge(
    {
      Name  = "${local.id}-${var.keys_specs[count.index].Name}"
      Usage = var.usage
    },
    var.default_tags
  )
}

################################################################################
# Alias
################################################################################
resource "aws_kms_alias" "this" {
  count         = length(var.keys_specs)
  name          = "alias/${local.id}-${var.keys_specs[count.index].Name}"
  target_key_id = aws_kms_key.this[count.index].arn
}

#################################################################################
## Policy
#################################################################################
resource "aws_kms_key_policy" "key_policies" {
  count  = length(var.keys_specs)
  key_id = aws_kms_key.this[count.index].key_id
  policy = file(var.keys_specs[count.index].policy_file)

}