resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_key_vault" "this" {
  count               = var.create_keyvault ? 1 : 0
  name                = var.keyvault_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tenant_id           = var.tenant_id
  sku_name            = "standard"
  #enable_soft_delete  = true
  soft_delete_retention_days = var.keyvault_soft_delete_retention_days
  public_network_access_enabled = var.keyvault_public_access

  tags = var.tags
}

resource "azurerm_storage_account" "this" {
  count                    = var.create_storage ? 1 : 0
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.this.name
  location                 = var.storage_location
  account_tier             = "Standard"
  account_replication_type = var.replication_type
  allow_nested_items_to_be_public = var.storage_public_access  
  public_network_access_enabled = var.public_network_access
  tags = var.tags
}