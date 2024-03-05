resource "azurerm_log_analytics_workspace" "dblogspace" {
    name = "dblogspaaace"
    location = local.location
    resource_group_name = local.resourcegroup.name
    depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_mssql_database_extended_auditing_policy" "example" {
  database_id                             = azurerm_mssql_database.appdb.id
  log_monitoring_enabled                  = true
  depends_on = [ azurerm_mssql_database.appdb ]
}

resource "azurerm_monitor_diagnostic_setting" "auditingdiagsetting" {
  name               = "${azurerm_mssql_database.appdb.name}-setting"
  target_resource_id = "${azurerm_mssql_database.appdb.id}"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.dblogspace.id
  enabled_log {
    category = "SQLSecurityAuditEvent"
  }
  depends_on = [ azurerm_mssql_database.appdb,
  azurerm_log_analytics_workspace.dblogspace ]
}