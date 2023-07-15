terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.65.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.5.1"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "prefix" {
  type    = string
  default = "tfstate"
}

variable "location" {
  type    = string
  default = "westeurope"
}

resource "random_string" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is created
    resource_group = azurerm_resource_group.resource_group.name
  }

  length  = 8
  special = false
}

resource "azurerm_resource_group" "resource_group" {
  name     = "rg-${var.prefix}"
  location = location
}

resource "azurerm_storage_account" "storage_account" {
  name                      = "${var.prefix}${lower(random_string.random_id.result)}"
  resource_group_name       = azurerm_resource_group.resource_group.name
  location                  = azurerm_resource_group.resource_group.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "tfstate-${lower(random_string.random_id.result)}"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

output "name" {
  value = azurerm_storage_account.storage_account.name
}

output "primary_access_key" {
  value     = azurerm_storage_account.storage_account.primary_access_key
  sensitive = true
}

output "container_name" {
  value = azurerm_storage_container.storage_container.name
}

output "resource_group_name" {
  value = azurerm_resource_group.resource_group.name
}
