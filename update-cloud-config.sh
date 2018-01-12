#!/usr/bin/env bash

set -euxo pipefail

terraform output \
  -state terraform-in/terraform.tfstate \
  -json \
  | jq 'map_values(.value)' \
  | tee terraform.tfvars.json

export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

bosh -n update-cloud-config ${SCRIPT_DIR}/cloud-config.yml \
  -o ${SCRIPT_DIR}/two-workers.yml \
  -o ${SCRIPT_DIR}/smaller-vms.yml \
  -o ${SCRIPT_DIR}/adjust-networks.yml \
  -o ${SCRIPT_DIR}/cf-lbs.yml \
  -l terraform.tfvars.json
