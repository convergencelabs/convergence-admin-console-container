#!/usr/bin/env bash

# Prepare Directories
mkdir -p build

# Copy the source files
cp -a src/* build

# Download the Convergence Admin Console
npm i
cp -a "node_modules/@convergence/admin-console/www" build

# Run the docker build
docker build -t convergencelabs/admin-console build