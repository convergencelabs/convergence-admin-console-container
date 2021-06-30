#!/usr/bin/env sh

set -e

# Run the docker build
docker build --no-cache -t convergencelabs/convergence-admin-console .
