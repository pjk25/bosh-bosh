#!/usr/bin/env bash

set -euxo pipefail

export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ls -al

# cp bosh-bosh/shim.tf bosh-bosh/template.tf .
cp terraform-in/terraform.tfstate .

# terraform init

terraform output

bosh -n update-cloud-config ${SCRIPT_DIR}/cloud-config.yml \
  -o ${SCRIPT_DIR}/two-workers.yml \
  -o ${SCRIPT_DIR}/smaller-vms.yml \
  -o ${SCRIPT_DIR}/adjust-networks.yml \
  -o ${SCRIPT_DIR}/disable-external-ips.yml \
  -o ${SCRIPT_DIR}/cf.yml
