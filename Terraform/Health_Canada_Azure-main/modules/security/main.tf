resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name                = "AllowAzureServices"
  server_id          = var.sql_server_id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
