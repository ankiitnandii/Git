resource "azurerm_resource_group" "rg" {
  name     = local.resourcegroup.name
  location = local.location
}

resource "azurerm_mssql_server" "sqlserver" {
  name                         = "sqldbseeerveeer"
  resource_group_name          = local.resourcegroup.name
  location                     = local.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Ankit@123"
  minimum_tls_version          = "1.2"
  depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_mssql_database" "appdb" {
  name           = "appdb"
  server_id      = azurerm_mssql_server.sqlserver.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2
  sku_name       = "Basic"
  depends_on = [ azurerm_resource_group.rg,
  azurerm_mssql_server.sqlserver ]
}

resource "azurerm_mssql_firewall_rule" "AllowClient" {
    name = "AllowClientIP"
    server_id = azurerm_mssql_server.sqlserver.id
    start_ip_address = "103.189.71.249"
    end_ip_address = "103.189.71.249"
    depends_on = [ azurerm_mssql_server.sqlserver,
    azurerm_resource_group.rg ]
}