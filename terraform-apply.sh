#!/usr/bin/env sh

set -euxo pipefail

cp bosh-bosh/shim.tf bosh-bosh/template.tf .
cp terraform-in/* .

terraform plan \
  -state-out terraform-out \
  -var env_id=${ENV_ID} \
  -var ssl_certificate="${CERTIFICATE}" \
  -var ssl_certificate_private_key="${PRIVATE_KEY}"
