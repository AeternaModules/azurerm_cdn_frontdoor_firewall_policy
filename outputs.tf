output "cdn_frontdoor_firewall_policies_id" {
  description = "Map of id values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cdn_frontdoor_firewall_policies_captcha_cookie_expiration_in_minutes" {
  description = "Map of captcha_cookie_expiration_in_minutes values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.captcha_cookie_expiration_in_minutes if v.captcha_cookie_expiration_in_minutes != null }
}
output "cdn_frontdoor_firewall_policies_custom_block_response_body" {
  description = "Map of custom_block_response_body values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.custom_block_response_body if v.custom_block_response_body != null && length(v.custom_block_response_body) > 0 }
}
output "cdn_frontdoor_firewall_policies_custom_block_response_status_code" {
  description = "Map of custom_block_response_status_code values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.custom_block_response_status_code if v.custom_block_response_status_code != null }
}
output "cdn_frontdoor_firewall_policies_custom_rule" {
  description = "Map of custom_rule values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.custom_rule if v.custom_rule != null && length(v.custom_rule) > 0 }
}
output "cdn_frontdoor_firewall_policies_enabled" {
  description = "Map of enabled values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.enabled if v.enabled != null }
}
output "cdn_frontdoor_firewall_policies_frontend_endpoint_ids" {
  description = "Map of frontend_endpoint_ids values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.frontend_endpoint_ids if v.frontend_endpoint_ids != null && length(v.frontend_endpoint_ids) > 0 }
}
output "cdn_frontdoor_firewall_policies_js_challenge_cookie_expiration_in_minutes" {
  description = "Map of js_challenge_cookie_expiration_in_minutes values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.js_challenge_cookie_expiration_in_minutes if v.js_challenge_cookie_expiration_in_minutes != null }
}
output "cdn_frontdoor_firewall_policies_log_scrubbing" {
  description = "Map of log_scrubbing values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.log_scrubbing if v.log_scrubbing != null && length(v.log_scrubbing) > 0 }
}
output "cdn_frontdoor_firewall_policies_managed_rule" {
  description = "Map of managed_rule values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.managed_rule if v.managed_rule != null && length(v.managed_rule) > 0 }
}
output "cdn_frontdoor_firewall_policies_mode" {
  description = "Map of mode values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.mode if v.mode != null && length(v.mode) > 0 }
}
output "cdn_frontdoor_firewall_policies_name" {
  description = "Map of name values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "cdn_frontdoor_firewall_policies_redirect_url" {
  description = "Map of redirect_url values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.redirect_url if v.redirect_url != null && length(v.redirect_url) > 0 }
}
output "cdn_frontdoor_firewall_policies_request_body_check_enabled" {
  description = "Map of request_body_check_enabled values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.request_body_check_enabled if v.request_body_check_enabled != null }
}
output "cdn_frontdoor_firewall_policies_resource_group_name" {
  description = "Map of resource_group_name values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "cdn_frontdoor_firewall_policies_sku_name" {
  description = "Map of sku_name values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.sku_name if v.sku_name != null && length(v.sku_name) > 0 }
}
output "cdn_frontdoor_firewall_policies_tags" {
  description = "Map of tags values across all cdn_frontdoor_firewall_policies, keyed the same as var.cdn_frontdoor_firewall_policies"
  value       = { for k, v in azurerm_cdn_frontdoor_firewall_policy.cdn_frontdoor_firewall_policies : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

