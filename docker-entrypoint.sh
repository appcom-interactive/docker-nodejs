#!/bin/bash
set -e

if [ "$1" = 'node' ]; then
  cd /node
  umask 0027
  yarn
  npm start
elif [ "$1" = 'test']; then
 cd /node
 umask 0027
 yarn
 npm run test
fi

exec "$@"

