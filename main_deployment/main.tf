terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.70.0"  # or latest 3.x
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true

}

module "keyvault_module" {
  source = "../keyvault_storage_module"

  resource_group_name                 = "rg-keyvault-ca-east"
  location                            = "Canada East"
  storage_location                    = "Canada East"
  keyvault_name                       = "kv-ca-east-example"
  tenant_id                           = "XXXXXXXX"
  create_keyvault                     = true
  create_storage                      = false
  keyvault_public_access              = false
  keyvault_soft_delete_retention_days = 7
  tags = {
    env = "dev"
  }
}

module "storage_module_lrs" {
  source = "../keyvault_storage_module"

  resource_group_name    = "rg-storage-ca-central"
  location               = "Canada Central"
  storage_location       = "Canada Central"
  storage_account_name   = "stgcentraldev123"
  create_keyvault        = false
  create_storage         = true
  replication_type       = "LRS"
  storage_public_access  = false
  public_network_access  = false
  tenant_id              = "XXXXXXXX"
  tags = {
    env = "dev"
  }
}

module "storage_module_ragrs" {
  source = "../keyvault_storage_module"

  resource_group_name    = "rg-storage-ca-east"
  location               = "Canada East"
  storage_location       = "Canada East"
  storage_account_name   = "stgeastdev456"
  create_keyvault        = false
  create_storage         = true
  replication_type       = "RAGRS"
  storage_public_access  = true
  public_network_access  = true
  tenant_id              = "XXXXXXXXXXXX"
  tags = {
    env = "dev"
  }
}
