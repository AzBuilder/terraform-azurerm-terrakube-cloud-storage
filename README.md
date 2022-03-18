# terraform-azurerm-terrakube-cloud-storage

Terrakube module to create cloud storage to save the terraform output, state and modules.

## Parameters
The module will require the following parameters:
- storage_name (default: terrakube)
- storage_location 
- storage_tier (Standard or Premium)
- storage_replication_type (LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS)

## Output Values

The module will output the following values:

- Azure Active Directory Application Id
- Azure Active Directory Tenat Id
- Azure Active Directory Application API URI
- Azure Active Directory Password

Example:

```bash
terraform apply --var "storage_name=terrakube" \
                --var "storage_location=eastus2" \
                --var "storage_tier=Standard" \
                --var "storage_replication_type=LRS" \
                --var "cors_domain=ui.terrakube.docker.internal";

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

storage_account_key = <sensitive>
storage_account_name = "XXXX"
storage_rg = "XXXXXX"
```

To see the value for the client password you can use the following command:

```bash
terraform console
nonsensitive(azurerm_storage_account.storage.primary_access_key)
"XXXXXXXXXXXXXXXXXXXX"
```

> These values will be used to setup the Terrakube Executor storage settings. 
