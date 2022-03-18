locals {
  storage_name   = lower(format("%s%s", var.storage_name, random_string.name_suffix.result))
  storage_name_rg   = lower(format("%s-%s-rg", var.storage_name, random_string.name_suffix.result))
  allowed_origins = tolist([var.cors_domain])
}