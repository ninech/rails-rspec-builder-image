#!/bin/sh

set -e

echo "Sleeping for one hour"
sleep 1h

if [ "$FAIL" ]; then
  echo "Failing..."
  /bin/false
else
  echo "Build successful..."
  /bin/true
fi
