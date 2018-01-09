#!/usr/bin/env bash

cd "$(dirname "$0")"

set -euxo pipefail

bosh -n update-cloud-config cloud-config.yml \
  -o two-workers.yml \
  -o smaller-vms.yml \
  -o less-disk.yml \
  -o adjust-networks.yml \
  -o disable-external-ips.yml \
  -o cf.yml
