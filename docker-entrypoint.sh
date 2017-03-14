#!/bin/bash
set -e

if [ "$1" = 'npm' ]; then
  cd /node
  umask 0027
  yarn
fi

exec "$@"
