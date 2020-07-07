#!/usr/bin/env sh

set -e

# Prepare the files.
$(dirname "$0")/prepare.sh

# Run the docker build
docker build --no-cache -t convergencelabs/convergence-admin-console build
