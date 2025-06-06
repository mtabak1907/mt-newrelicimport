terraform {
  backend "azurerm" {
    storage_account_name = "mtstorage2023"
    container_name       = "mttfstate"
    key                  = "mt-newrelic.terraform.tfstate"
    sas_token            = var.azure_sas_token
  }
}
