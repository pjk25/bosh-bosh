#!/usr/bin/env sh

set -euxo pipefail

cp bosh-bosh/shim.tf bosh-bosh/template.tf .
cp terraform-in/terraform.tfstate .

terraform init

terraform apply \
  -auto-approve \
  -var env_id=${ENV_ID} \
  -var ssl_certificate="${CERTIFICATE}" \
  -var ssl_certificate_private_key="${PRIVATE_KEY}" \
  -state-out terraform-out/terraform.tfstate
