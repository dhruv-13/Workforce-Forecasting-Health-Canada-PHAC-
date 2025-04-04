resource "azurerm_synapse_workspace" "synapse" {
  name                     = var.synapse_name
  resource_group_name       = var.resource_group_name
  location                 = var.location
  identity {
    type = "SystemAssigned"
  }
  storage_data_lake_gen2_filesystem_id = var.datalake_id
}

resource "azurerm_synapse_sql_pool" "synapse_sql" {
  name                    = "hr_synapse_sqlpool_parm0100"
  synapse_workspace_id    = azurerm_synapse_workspace.synapse.id
  sku_name                = "DW100c"
  create_mode             = "Default"
  storage_account_type    = "LRS"
  geo_backup_policy_enabled = false
}

output "synapse_workspace_name" {
  value = azurerm_synapse_workspace.synapse.name
}
