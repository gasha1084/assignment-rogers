variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_location" {
  type = string
}

variable "keyvault_name" {
  type      = string
  default   = ""
}

variable "storage_account_name" {
  type      = string
  default   = ""
}

variable "tenant_id" {
  type = string
}

variable "create_keyvault" {
  type    = bool
  default = false
}

variable "create_storage" {
  type    = bool
  default = false
}

variable "replication_type" {
  type    = string
  default = "LRS"
}

variable "keyvault_public_access" {
  type    = bool
  default = false
}

variable "keyvault_soft_delete_retention_days" {
  type    = number
  default = 7
}

variable "storage_public_access" {
  type    = bool
  default = false
}

variable "public_network_access" {
    type = bool
    default = true

}

variable "tags" {
  type = map(string)
  validation {
    condition     = contains(["dev", "qa", "stg", "prd"], var.tags["env"])
    error_message = "Invalid environment tag value. Allowed values: dev, qa, stg, prd"
  }
}