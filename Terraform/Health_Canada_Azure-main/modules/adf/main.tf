resource "azurerm_data_factory" "adf" {
  name                = var.adf_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_data_factory_linked_service_azure_sql_database" "sql_linked_service" {
  name                = "AzureSQLDBLinkedService"
  data_factory_id     = azurerm_data_factory.adf.id
  connection_string   = "Server=tcp:${var.sql_server_name}.database.windows.net;Database=${var.sql_db_name};User ID=${var.admin_username};Password=${var.admin_password};"
}

output "adf_name" {
  value = azurerm_data_factory.adf.name
}
