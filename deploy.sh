#!/bin/bash

set -xeuo pipefail

ls -la

git describe --tags || true

version=$(git describe --tags --exact-match || true)

# Regex: Starts with v, then digits.digits.digits
if [[ $version =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Match"
  echo npx wrangler deploy
else
  echo "No match"
fi
