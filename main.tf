resource "random_string" "name_suffix" {
  length           = 5  
  special          = false
  lower            = true
}

resource "azurerm_resource_group" "rg" {
  name     = local.storage_name_rg
  location = var.storage_location
}

resource "azurerm_storage_account" "storage" {
  name                     = local.storage_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true

  blob_properties {
    cors_rule{
      allowed_headers = ["*"]
      allowed_methods = ["GET","OPTIONS"] 
      allowed_origins = local.allowed_origins
      exposed_headers = ["*"]
      max_age_in_seconds = 3600
    }
  }
}

resource "azurerm_storage_container" "registry" {
  name                  = "registry"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "blob"
}

resource "azurerm_storage_container" "tfoutput" {
  name                  = "tfoutput"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}