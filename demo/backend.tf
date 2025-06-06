terraform {
  backend "azurerm" {
    storage_account_name = "mtsauksouth1"
    container_name       = "mttest"
    key                  = "mt-newrelic.demo-terraform.tfstate"
  }
}
