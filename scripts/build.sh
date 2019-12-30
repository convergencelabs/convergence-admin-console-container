#!/usr/bin/env sh

set -e

# Prepare the files.
$(dirname "$0")/prepare.sh

# Run the docker build
docker build -t convergencelabs/convergence-admin-console build