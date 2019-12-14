#!/usr/bin/env bash

# Download the admin console
npm install

# Prepare the files.
./prepare.sh

# Run the docker build
docker build -t convergencelabs/convergence-admin-console build