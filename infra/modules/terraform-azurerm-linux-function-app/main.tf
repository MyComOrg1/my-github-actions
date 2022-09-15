resource "azurerm_service_plan" "sp" {
  name                = var.service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.sp_os_type
  sku_name            = var.sp_sku_name
}

locals {
  auth = var.auth_settings_enabled? [
    {
      runtime_version                 = var.auth_settings_version
      enabled                         = var.auth_settings_enabled
      token_store_enabled             = var.auth_token_store_enabled
      unauthenticated_client_action   = var.unauthenticated_client_action
      identity_provider_client_id     = var.identity_provider_client_id
      default_identity_provider       = var.default_identity_provider
      identity_issuer                 = var.identity_issuer
    }
  ] : []
}

resource "azurerm_linux_function_app" "function-app" {
  name                = var.funtion_app_name
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = var.storage_name
  storage_account_access_key = azurerm_storage_account.storage.primary_access_key
  service_plan_id            = azurerm_service_plan.sp.id
  //version = "" //todo: how to find out the version?

  site_config {
    application_stack {
      python_version = "3.9" //todo: parameterize with map
    }
  }

  //todo: parameterize 
  app_settings = {
    // note: WEBSITE_RUN_FROM_PACKAGE will not allow function creation
    "WEBSITE_RUN_FROM_PACKAGE" = "https://${var.storage_name}.blob.core.windows.net/${azurerm_storage_container.httpTrigger1_function_app.name}/${azurerm_storage_blob.storage_blob.name}${data.azurerm_storage_account_blob_container_sas.storage_account_blob_container_sas.sas}"
    "FUNCTIONS_WORKER_RUNTIME" = "python"
    "WEBSITE_ENABLE_SYNC_UPDATE_SITE" = true
    "FUNCTION_APP_EDIT_MODE" = "readwrite"
    //"MICROSOFT_PROVIDER_AUTHENTICATION_SECRET" = "" // todo: secure this
    //"WEBSITES_ENABLE_APP_SERVICE_STORAGE" = 
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.appinsights.instrumentation_key
 }

  dynamic "auth_settings" {
    for_each = local.auth
    iterator = item

    content {
      runtime_version = item.value.runtime_version
      enabled = item.value.enabled
      token_store_enabled = item.value.token_store_enabled
      unauthenticated_client_action = item.value.unauthenticated_client_action
      active_directory  {
        client_id = item.value.identity_provider_client_id
      }
      default_provider = item.value.default_identity_provider
      issuer = item.value.identity_issuer
    }
  }
 
  depends_on = [azurerm_storage_account.storage]
}


data "archive_file" "httpTrigger1_function_app" {
  type        = "zip"
  source_dir  = "${path.module}/../../../functions"
  output_path = "functions.zip"
}

resource "azurerm_storage_container" "httpTrigger1_function_app" {
  name                  = var.storage_container_name
  storage_account_name  = var.storage_name
  container_access_type = var.storage_container_access_type

  depends_on = [
    azurerm_storage_account.storage
  ]
}

resource "azurerm_storage_blob" "storage_blob" {
  name = "${filesha256(data.archive_file.httpTrigger1_function_app.output_path)}.zip"
  storage_account_name = var.storage_name
  storage_container_name = azurerm_storage_container.httpTrigger1_function_app.name
  type = "Block"
  source = data.archive_file.httpTrigger1_function_app.output_path

  depends_on = [
    azurerm_storage_container.httpTrigger1_function_app
  ]
}


data "azurerm_storage_account_blob_container_sas" "storage_account_blob_container_sas" {
  connection_string = azurerm_storage_account.storage.primary_connection_string
  container_name    = azurerm_storage_container.httpTrigger1_function_app.name

  start = var.storage_account_blob_container_sas_start
  expiry = var.storage_account_blob_container_sas_expiry

  permissions {
    read   = true
    add    = false
    create = false
    write  = false
    delete = false
    list   = false
  }
}

resource "azurerm_application_insights" "appinsights" {
  name                = "${var.funtion_app_name}-appinsights"
  resource_group_name = var.resource_group_name
  location            = var.location
  application_type    = var.app_insights_application_type
}

// Note: share storage accounts for multiple function apps are not recommended for production environment
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  //todo: access type?

  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
}