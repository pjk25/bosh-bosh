#!/usr/bin/env bash

cd "$(dirname "$0")"

set -euxo pipefail

ls -al

# cp bosh-bosh/shim.tf bosh-bosh/template.tf .
cp terraform-in/terraform.tfstate .

# terraform init

terraform output

bosh -n update-cloud-config cloud-config.yml \
  -o two-workers.yml \
  -o smaller-vms.yml \
  -o adjust-networks.yml \
  -o disable-external-ips.yml \
  -o cf.yml
