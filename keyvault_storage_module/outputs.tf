output "keyvault_id" {
  value       = try(azurerm_key_vault.this[0].id, null)
  description = "ID of the Key Vault"
}

output "storage_account_id" {
  value       = try(azurerm_storage_account.this[0].id, null)
  description = "ID of the Storage Account"
}