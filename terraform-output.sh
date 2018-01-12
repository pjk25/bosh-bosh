#!/usr/bin/env sh

set -euxo pipefail

terraform output -state terraform-in/terraform.tfstate
