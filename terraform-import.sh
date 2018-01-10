#!/usr/bin/env sh

set -euxo pipefail

terraform import \
  -var project_id=${PROJECT_ID} \
  -var region=${REGION} \
  -var credentials="${GOOGLE_CREDENTIALS}" \
  google_compute_network.bbl-network
  ${NETWORK_NAME}
