#!/usr/bin/env sh

set -euxo pipefail

cp bosh-bosh/shim.tf bosh-bosh/template.tf .
cp terraform-in/terraform.tfstate .

terraform init

terraform destroy \
  -var env_id=${ENV_ID} \
  -var ssl_certificate="${CERTIFICATE}" \
  -var ssl_certificate_private_key="${PRIVATE_KEY}" \
  -target google_compute_firewall.firewall-cf \
  -target google_compute_global_address.cf-address \
  -target google_compute_global_forwarding_rule.cf-http-forwarding-rule \
  -target google_compute_global_forwarding_rule.cf-https-forwarding-rule \
  -target google_compute_target_http_proxy.cf-http-lb-proxy \
  -target google_compute_target_https_proxy.cf-https-lb-proxy \
  -target google_compute_ssl_certificate.cf-cert \
  -target google_compute_url_map.cf-https-lb-url-map \
  -target google_compute_health_check.cf-public-health-check \
  -target google_compute_http_health_check.cf-public-health-check \
  -target google_compute_firewall.cf-health-check \
  -target google_compute_address.cf-ssh-proxy \
  -target google_compute_firewall.cf-ssh-proxy \
  -target google_compute_target_pool.cf-ssh-proxy \
  -target google_compute_forwarding_rule.cf-ssh-proxy \
  -target google_compute_firewall.cf-tcp-router \
  -target google_compute_address.cf-tcp-router \
  -target google_compute_http_health_check.cf-http-router \
  -target google_compute_target_pool.cf-http-router \
  -target google_compute_forwarding_rule.cf-http-router \
  -target google_compute_address.cf-ws \
  -target google_compute_target_pool.cf-ws \
  -target google_compute_forwarding_rule.cf-ws-https \
  -target google_compute_forwarding_rule.cf-ws-http \
  -target google_compute_firewall.credhub \
  -target google_compute_address.credhub \
  -target google_compute_target_pool.credhub \
  -target google_compute_forwarding_rule.credhub \
  -target google_compute_instance_group.router-lb-0 \
  -target google_compute_instance_group.router-lb-1 \
  -target google_compute_instance_group.router-lb-2 \
  -target google_compute_backend_service.router-lb-backend-service \
  -state-out terraform-out/terraform.tfstate
