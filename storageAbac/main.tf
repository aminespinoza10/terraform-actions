provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "mahes-group"
  location = "eastus2"
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storageAccountName
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  provisioner "local-exec" {
    command = "az role assignment create --role \"Storage Blob Data Reader\" --scope /subscriptions/${var.subscriptionId}/resourceGroups/${azurerm_resource_group.rg.name}/providers/Microsoft.Storage/storageAccounts/${var.storageAccountName} --assignee \"${var.asigneeName}\" --description \"Read access if container name equals blobs-example-container\" --condition \"((!(ActionMatches{'Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read'})) OR (@Resource[Microsoft.Storage/storageAccounts/blobServices/containers:name] StringEquals '${var.blobContainer}'))\" --condition-version \"2.0\""
  }
}

resource "azurerm_storage_container" "example" {
  name                  = var.blobContainer
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "container"
}