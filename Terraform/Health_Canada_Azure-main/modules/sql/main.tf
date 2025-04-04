resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
}

resource "azurerm_mssql_database" "sql_db" {
  name                = var.sql_db_name
  server_id          = azurerm_mssql_server.sql_server.id
  collation          = "SQL_Latin1_General_CP1_CI_AS"
  license_type       = "LicenseIncluded"
  max_size_gb        = 50
  sku_name           = "S3"
}

output "sql_server_name" {
  value = azurerm_mssql_server.sql_server.name
}

output "sql_db_name" {
  value = azurerm_mssql_database.sql_db.name
}
