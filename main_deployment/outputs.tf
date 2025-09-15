output "keyvault_id" {
  value = module.keyvault_module.keyvault_id
}

output "storage_lrs_id" {
  value = module.storage_module_lrs.storage_account_id
}

output "storage_ragrs_id" {
  value = module.storage_module_ragrs.storage_account_id
}