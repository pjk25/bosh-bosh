#!/usr/bin/env sh

set -euxo pipefail

cp bosh-bosh/shim.tf bosh-bosh/template.tf .

terraform init

terraform import \
  google_compute_network.bbl-network
  ${NETWORK_NAME}
