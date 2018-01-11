#!/usr/bin/env sh

set -euxo pipefail

cp bosh-bosh/shim.tf bosh-bosh/template.tf .

terraform init

terraform import \
  -state-out terraform/terraform.tfstate \
  google_compute_network.bbl-network \
  ${NETWORK_NAME}
