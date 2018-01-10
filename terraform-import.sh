#!/usr/bin/env sh

set -euxo pipefail

pushd bosh-bosh

terraform init

terraform import \
  -var project_id=${PROJECT_ID} \
  -var region=${REGION} \
  -var credentials="${GOOGLE_CREDENTIALS}" \
  google_compute_network.bbl-network
  ${NETWORK_NAME}
