output "www_hostname" {
  value = "${module.www.hostname}"
}

output "www_service_public_ips" {
  value = "${module.www.service_public_ips}"
}

output "www_service_private_ips" {
  value = "${module.www.service_private_ips}"
}
