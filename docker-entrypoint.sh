#!/bin/bash
set -e

# if the command starts with npm, we will first go to /node and install the dependencies
if [ "$1" = 'node' ] || [ "$1" = 'npm' ]; then
  cd /node
  umask 0027
  npm install --only=production
fi

exec "$@"
