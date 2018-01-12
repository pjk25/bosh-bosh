#!/usr/bin/env bash

set -euxo pipefail

jq 'map_values(.value)' terraform-outputs/terraform.tfvars.json > terraform.tfvars

export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

bosh -n update-cloud-config ${SCRIPT_DIR}/cloud-config.yml \
  -o ${SCRIPT_DIR}/two-workers.yml \
  -o ${SCRIPT_DIR}/smaller-vms.yml \
  -o ${SCRIPT_DIR}/adjust-networks.yml \
  -o ${SCRIPT_DIR}/disable-external-ips.yml \
  -o ${SCRIPT_DIR}/cf.yml \
  -o ${SCRIPT_DIR}/cf-lbs.yml \
  -l terraform.tfvars
