#!/usr/bin/env bash

set -euxo pipefail

ls

which bosh

bosh -n update-cloud-config cloud-config.yml \
  -o two-workers.yml \
  -o smaller-vms.yml \
  -o adjust-networks.yml \
  -o disable-external-ips.yml \
  -o cf.yml
