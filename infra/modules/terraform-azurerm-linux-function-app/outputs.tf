output "app_id" {
  value = azurerm_linux_function_app.function-app.id
}
output "app_settings" {
  value = azurerm_linux_function_app.function-app.app_settings
}
output "auth_settings" {
  value = azurerm_linux_function_app.function-app.auth_settings
}
output "connection_string" {
  value = azurerm_linux_function_app.function-app.connection_string
}
