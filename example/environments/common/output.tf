output "www_hostname" {
  value = "${module.main.www_hostname}"
}

output "www_service_public_ips" {
  value = "${module.main.www_service_public_ips}"
}

output "www_service_private_ips" {
  value = "${module.main.www_service_private_ips}"
}
