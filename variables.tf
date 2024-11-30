#org_name = ot
#region_name = eucen1
#environment =poc
#project_name = cicm
#resource_name = kms
#resource_desc = key

#locals {
#  id = "${var.org_name}-${var.region_name}-${var.environment}-${var.project_name}-${var.resource_name}-${var.resource_desc}"
#}

variable "org_name" {
  description = "the organization name to be used for naming convention"
  type        = string
  default     = null
}

variable "region_name" {
  description = "the region name to be used for naming convention"
  type        = string
  default     = null
}

variable "environment" {
  type        = string
  description = "namespace to segregate the resources from other environment and used in the naming convention"
  default     = null
}

variable "project_name" {
  description = "the project name to be used for naming convention"
  type        = string
  default     = null
}

variable "resource_name" {
  description = "the resource name to be used for naming convention"
  type        = string
  default     = null
}

variable "resource_desc" {
  description = "the resource desc to be used for naming convention"
  type        = string
  default     = null
}

variable "default_tags" {
  description = "Additional resource tags to be applied to all the resources created"
  type        = map(string)
  default     = {}
}

variable "keys_specs" {
  description = "List of specifications for creating KMS keys"
  type = list(object({
    Name        = string
    policy_file = string
    # add_policy  = bool
  }))
  default = [
    {
      Name        = "eks"
      policy_file = "./eks_policy.json"
    }
  ]
}


variable "usage" {
  description = "Purpose of the KMS key"
  type        = string
  default     = "encypt-decrypt"
}

variable "deletion_window_in_days" {
  description = "number of days to delete the key"
  type        = number
  default     = 30
}

variable "enable_key_rotation" {
  description = "enable the rotation of keys"
  type        = bool
  default     = false
}
variable "key_usage" {
  description = "key usage,allowed values are ENCRYPT_DECRYPT, SIGN_VERIFY, or GENERATE_VERIFY_MAC"
  default     = "ENCRYPT_DECRYPT"
  type        = string
}
variable "multi_region" {
  description = "Indicates whether the KMS key is a multi-Region"
  type        = bool
  default     = false
}