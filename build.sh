#!/bin/sh

set -e

if [ "$FAIL" ]; then
  echo "Failing..."
  exec /bin/false
else
  echo "Build successful..."
  exec /bin/true
fi
