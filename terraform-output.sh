#!/usr/bin/env sh

set -euxo pipefail

terraform output \
  -state terraform-in/terraform.tfstate \
  -json | tee terraform-outputs/terraform.tfvars.json
