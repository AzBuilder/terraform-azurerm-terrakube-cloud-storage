output "storage_rg" {
  value       = azurerm_resource_group.rg.name
  description = "Azure storage account resource group"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage.name
  description = "Azure storage account name"
}

output "storage_account_key" {
  value       = azurerm_storage_account.storage.primary_access_key
  description = "Azure Active Directory Application API URI"
  sensitive   = true
}
