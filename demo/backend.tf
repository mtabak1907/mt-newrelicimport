terraform {
  backend "azurerm" {
    storage_account_name = "mtstorage2023"
    container_name       = "mttfstate"
    key                  = "mt-newrelic.demo-terraform.tfstate"
  }
}
