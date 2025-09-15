# Terraform Assignment – Dynamic Key Vault & Storage Deployment

## Overview

This Terraform project demonstrates a **dynamic and reusable module** to deploy Azure resources:

- **Key Vault**
- **Storage Accounts** (LRS / RA-GRS)

The module is **environment-aware**, supports **conditional properties**, and automatically creates **resource groups per location**.  

The solution uses a **single module** for multiple resource types, making it scalable and maintainable.

---

## Directory Structure

```
keyvault_storage_module/
├── main.tf                 # module to orchestrate 
├── outputs.tf              # Outputs for deployed resources
├── variables.tf            # Variables for module creation
main_deployment/
├── main.tf                 # Root module to orchestrate 
├── outputs.tf              # Outputs for deployed resources
```

---

## Features

1. **Environment-aware Deployment**  
   - `env` variable accepts: `dev`, `qa`, `stg`, `prd`.  
   - Resource names automatically append the environment suffix (`-dev`, `-qa`, etc.).    

2. **Dynamic Resource Groups**  
   - Automatically creates one Resource Group per location per environment.  

3. **Outputs for Verification**  
   - Root module aggregates all resource names, IDs, RG, type, location, and environment.  

---

## Steps to Run

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd assignment-rogers
```

### 2. Initialize Terraform

```bash
terraform init
```

This downloads the required providers and prepares the backend.

### 3. Validate Configuration

```bash
terraform validate
```

Ensures all HCL files are syntactically correct.

### 4. Plan Deployment

```bash
terraform plan
```

- Verifies which resources will be created.  
- Checks Resource Groups, Key Vaults, and Storage Accounts per environment.

### 5. Apply Deployment

```bash
terraform apply
```

- Deploys all resources in Azure.  
- Automatically creates RGs per location.  
- Applies conditional properties (Key Vault soft delete, Storage replication).

---

## Verifying Resource Creation

After deployment, Terraform outputs a summary:

### Sample Output

keyvault_id = "subscriptions/XXXXXXXX/resourceGroups/rg-keyvault-ca-east/providers/Microsoft.KeyVault/vaults/kv-ca-east-example"
storage_lrs_id = "/subscriptions/XXXXXXXX/resourceGroups/rg-storage-ca-central/providers/Microsoft.Storage/storageAccounts/stgcentraldev123"
storage_ragrs_id = "/subscriptions/XXXXXXXX/resourceGroups/rg-storage-ca-east/providers/Microsoft.Storage/storageAccounts/stgeastdev456"


### Screenshots

<img width="1670" height="638" alt="image" src="https://github.com/user-attachments/assets/96db7005-d9bd-4969-8e4b-4aabb67556a4" />

<img width="1789" height="743" alt="image" src="https://github.com/user-attachments/assets/d9e187e5-086f-4475-9c22-9dffca9c09a9" />

<img width="1789" height="743" alt="image" src="https://github.com/user-attachments/assets/6b14c4bb-d2d5-4ecc-bf63-dfd101581d40" />


