# Bootstrap Azure Storage Account for Terraform State

This repository contains Terraform code to bootstrap an Azure Storage Account for storing Terraform state. The code creates a new resource group, storage account, and blob container.

## Prerequisites

Before you can use this Terraform code, you must have the following:

- An Azure subscription
- Azure CLI installed on your local machine
- Terraform installed on your local machine

## Lifecycle

The Terraform code in this repository is intended to be used once to bootstrap a storage account for storing Terraform state. Once the storage account has been created, you should update your Terraform configuration to use the new storage account as a backend. Take note of the lifecycle block in `azurerm_storage_account`:

```hcl

  lifecycle {
  prevent_destroy = true
}

```

This block prevents the storage account from being destroyed by Terraform. This is to prevent accidental deletion of the storage account and the Terraform state stored within it. If you wish to destroy the storage account, you must first remove the lifecycle block from the code.

## Usage

1. Clone this repository to your local machine.
2. Open a terminal and navigate to the cloned repository.
3. Run `az login` to authenticate with your Azure subscription.
4. Run `terraform init` to initialize the Terraform working directory.
5. Open `main.tf` and update the `prefix` variable to a unique value.
6. Run `terraform plan` to preview the resources that will be created.
7. Run `terraform apply` to create the resources.
8. Take note of the output values for `storage_account_name`,`container_name`, `resource_group_name`, and `primary_access_key`, these will be used in your Terraform configuration.
9. Now update your backend settings in your Terraform configuration to use the new storage account. For example:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate123456"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
```

## Variables

The following variables can be set in `main.tf`:

- `prefix`: A prefix to add to all resource names to ensure uniqueness. Default is `tfstate`.
- `location`: The Azure region in which to create the resources. Default is `westeurope`.

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue. If you would like to contribute code, please fork the repository and submit a pull request.

## License

This code is licensed under the MIT License. See the `LICENSE` file for details.

I hope this helps! Let me know if you have any further questions. ▌
