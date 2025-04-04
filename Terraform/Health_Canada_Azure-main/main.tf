resource "azurerm_resource_group" "hr_rg" {
  name     = "hr-rg"
  location = "East US"
}

# Create an Azure Storage account and Data Lake Gen 2 filesystem
resource "azurerm_storage_account" "storage_account" {
  name                     = "mystorageaccountparm0100"
  resource_group_name      = azurerm_resource_group.hr_rg.name
  location                 = azurerm_resource_group.hr_rg.location
  account_tier              = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalake_fs" {
  name                = "mydatalakefilesystem"
  storage_account_id  = azurerm_storage_account.storage_account.id
}

module "sql" {
  source              = "./modules/sql"
  sql_server_name     = "hr-sqlserver-parm0100"
  sql_db_name         = "hrdb"
  resource_group_name = azurerm_resource_group.hr_rg.name
  location            = azurerm_resource_group.hr_rg.location
  admin_username      = "adminuser"
  admin_password      = "SecureP@ssword!"
  
  depends_on = [azurerm_resource_group.hr_rg]
}

module "adf" {
  source              = "./modules/adf"
  adf_name            = "hr-adf-parm0100"
  location            = azurerm_resource_group.hr_rg.location
  resource_group_name = azurerm_resource_group.hr_rg.name
  sql_server_name     = module.sql.sql_server_name
  sql_db_name         = module.sql.sql_db_name
  admin_username      = "adminuser"
  admin_password      = "SecureP@ssword!"
  
  depends_on = [azurerm_resource_group.hr_rg, module.sql]
}

module "synapse" {
  source              = "./modules/synapse"
  synapse_name        = "hr-synapse-parm0100"
  resource_group_name = azurerm_resource_group.hr_rg.name
  location            = azurerm_resource_group.hr_rg.location
  datalake_id         = azurerm_storage_data_lake_gen2_filesystem.datalake_fs.id
}
