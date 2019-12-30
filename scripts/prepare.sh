#!/usr/bin/env sh

set -e

mkdir -p build
cp -a src/* build

cd build

# Download the admin console
npm install