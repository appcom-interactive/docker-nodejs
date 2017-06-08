#!/bin/bash
set -e

docker pull alpine:3.6

docker build -f Dockerfile-6 -t appcom/nodejs:6 .
docker build -f Dockerfile-7 -t appcom/nodejs:7 .
docker build -f Dockerfile-8 -t appcom/nodejs:8 .
docker tag appcom/nodejs:8 appcom/nodejs:latest
docker tag appcom/nodejs:6 appcom/nodejs:lts
