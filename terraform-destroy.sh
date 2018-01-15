#!/usr/bin/env sh

set -euxo pipefail

cp bosh-bosh/shim.tf bosh-bosh/template.tf .
cp terraform-in/terraform.tfstate .

terraform init

terraform destroy \
  -var env_id=${ENV_ID} \
  -var ssl_certificate="${CERTIFICATE}" \
  -var ssl_certificate_private_key="${PRIVATE_KEY}" \
  -target firewall-cf \
  -target cf-address \
  -target cf-http-forwarding-rule \
  -target cf-https-forwarding-rule \
  -target cf-http-lb-proxy \
  -target cf-https-lb-proxy \
  -target cf-cert \
  -target cf-https-lb-url-map \
  -target cf-public-health-check \
  -target cf-health-check \
  -target cf-ssh-proxy \
  -target cf-tcp-router \
  -target cf-ws \
  -target cf-ws-https \
  -target cf-ws-http \
  -target credhub \
  -target router-lb-0 \
  -target router-lb-1 \
  -target router-lb-2 \
  -target router-lb-backend-service \
  -state-out terraform-out/terraform.tfstate
