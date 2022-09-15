output "application_id" {
  value = data.azuread_application.ad-app.application_id
}
output "display_name" {
  value = data.azuread_application.ad-app.display_name
}
output "object_id" {
  value = data.azuread_application.ad-app.object_id
}