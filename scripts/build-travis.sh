#!/bin/bash
set -e

# Run the dist build
cd $PLATFORM
make -j4 dist

# Create a ZIP for S3 deployment
cd build
mkdir -p ../../dist
zip ../../dist/breakpad-tools-$PLATFORM.zip *
