#!/usr/bin/env sh

set -euxo pipefail

cp bosh-bosh/shim.tf bosh-bosh/template.tf .
cp terraform-in/terraform.tfstate .

terraform init

terraform output
