#!/bin/bash

set -euo pipefail

version=$(git describe --tags --exact-match || echo "")

# Regex: Starts with v, then digits.digits.digits
if [[ $version =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Match"
  npx wrangler deploy
else
  echo "No match"
fi
