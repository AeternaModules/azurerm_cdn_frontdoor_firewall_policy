output "cdn_frontdoor_firewall_policies" {
  description = "All cdn_frontdoor_firewall_policy resources"
  value       = azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies
}
output "cdn_frontdoor_firewall_policies_captcha_cookie_expiration_in_minutes" {
  description = "List of captcha_cookie_expiration_in_minutes values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.captcha_cookie_expiration_in_minutes]
}
output "cdn_frontdoor_firewall_policies_custom_block_response_body" {
  description = "List of custom_block_response_body values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.custom_block_response_body]
}
output "cdn_frontdoor_firewall_policies_custom_block_response_status_code" {
  description = "List of custom_block_response_status_code values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.custom_block_response_status_code]
}
output "cdn_frontdoor_firewall_policies_custom_rule" {
  description = "List of custom_rule values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.custom_rule]
}
output "cdn_frontdoor_firewall_policies_enabled" {
  description = "List of enabled values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.enabled]
}
output "cdn_frontdoor_firewall_policies_frontend_endpoint_ids" {
  description = "List of frontend_endpoint_ids values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.frontend_endpoint_ids]
}
output "cdn_frontdoor_firewall_policies_js_challenge_cookie_expiration_in_minutes" {
  description = "List of js_challenge_cookie_expiration_in_minutes values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.js_challenge_cookie_expiration_in_minutes]
}
output "cdn_frontdoor_firewall_policies_log_scrubbing" {
  description = "List of log_scrubbing values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.log_scrubbing]
}
output "cdn_frontdoor_firewall_policies_managed_rule" {
  description = "List of managed_rule values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.managed_rule]
}
output "cdn_frontdoor_firewall_policies_mode" {
  description = "List of mode values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.mode]
}
output "cdn_frontdoor_firewall_policies_name" {
  description = "List of name values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.name]
}
output "cdn_frontdoor_firewall_policies_redirect_url" {
  description = "List of redirect_url values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.redirect_url]
}
output "cdn_frontdoor_firewall_policies_request_body_check_enabled" {
  description = "List of request_body_check_enabled values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.request_body_check_enabled]
}
output "cdn_frontdoor_firewall_policies_resource_group_name" {
  description = "List of resource_group_name values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.resource_group_name]
}
output "cdn_frontdoor_firewall_policies_sku_name" {
  description = "List of sku_name values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.sku_name]
}
output "cdn_frontdoor_firewall_policies_tags" {
  description = "List of tags values across all cdn_frontdoor_firewall_policies"
  value       = [for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : v.tags]
}

