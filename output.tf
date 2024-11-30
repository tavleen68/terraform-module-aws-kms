output "kms_keys" {
  value = aws_kms_key.this[*].arn
}