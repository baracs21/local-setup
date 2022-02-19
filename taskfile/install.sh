#!/usr/bin/env bash

set -euox pipefail

sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin

