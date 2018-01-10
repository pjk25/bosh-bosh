#!/usr/bin/env sh

set -euxo pipefail

cp bosh-bosh/shim.tf bosh-bosh/template.tf .

terraform init

terraform import \
  google_compute_network.bbl-network \
  ${NETWORK_NAME}

terraform plan \
  -var env_id=${ENV_ID} \
  -var ssl_certificate="${CERTIFICATE}" \
  -var ssl_certificate_private_key="${PRIVATE_KEY}"
