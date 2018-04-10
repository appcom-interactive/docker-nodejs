#!/bin/bash
set -e

docker pull alpine:3.7

docker build -f Dockerfile-8 -t appcom/nodejs:8 .
docker build -f Dockerfile-9 -t appcom/nodejs:9 .

docker tag appcom/nodejs:9 appcom/nodejs:latest
docker tag appcom/nodejs:8 appcom/nodejs:lts
