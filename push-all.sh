#!/bin/bash
set -e

docker push appcom/nodejs:6
docker push appcom/nodejs:7
docker push appcom/nodejs:8
docker push appcom/nodejs:lts
docker push appcom/nodejs:latest
