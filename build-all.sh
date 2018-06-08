#!/bin/bash
set -e

docker pull alpine:3.7
docker pull debian:stretch-20180426

# alpine based
docker build -f Dockerfile-8 -t appcom/nodejs:8 .
docker build -f Dockerfile-9 -t appcom/nodejs:9 .

# debian based
docker build -f Dockerfile-debian-9 -t appcom/nodejs:debian-9 .
docker build -f Dockerfile-debian-10 -t appcom/nodejs:debian-10 .

docker tag appcom/nodejs:9 appcom/nodejs:latest
docker tag appcom/nodejs:8 appcom/nodejs:lts
