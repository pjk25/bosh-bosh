#!/usr/bin/env bash

set -euxo pipefail

# cp bosh-bosh/shim.tf bosh-bosh/template.tf .
cp terraform-in/terraform.tfstate .

# terraform init

terraform output
