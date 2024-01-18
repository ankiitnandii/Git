locals {
  resourcegroup = {
    name = "RG1"
  }
  location = "Central India"
  virtual_network = {
    name          = "app-network"
    address_space = ["10.0.0.0/16"]
  }
  frontend_port_name = "frontendport"
  frontend_ip_configuration_name ="ipconfig"
  backend_address_pool_name = "poolA"
  http_setting_name = "httpsetting"
  listener_name = "listenerA"
  request_routing_rule_name = "ruleA"
  function=["videos","images"]
}