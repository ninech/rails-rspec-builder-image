#!/bin/sh

set -e

if [ "$FAIL" ]; then
  exec /bin/false
else
  exec /bin/true
fi
