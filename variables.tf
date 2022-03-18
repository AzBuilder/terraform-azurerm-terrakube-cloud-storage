
variable "storage_name" {
  type    = string
  default = "terrakube"
}

variable "storage_location" {
  type    = string
  default = "eastus2"
}

variable "storage_tier" {
  type    = string
}

variable "storage_replication_type" {
  type    = string
}

variable "cors_domain" {
  type    = string
  description = "CORS for storage account Example: ui.terrakube.docker.internal"
}