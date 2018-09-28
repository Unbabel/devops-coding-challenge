#!/bin/bash
#
# MAINTAINER: Rui Grafino
# DATE: 19/09/2018
# VERSION: v1.0


# Copy src code to Dockerfile folder because it does not goes back in folder structure
cp -r ../MultiVAC ./server
cp -r ../MultiVAC ./worker
cp -r ../MultiVAC ./mongodb

# Do a multi docker build with compose
docker-compose build

# Remove all temporary files
rm -rf ./server/MultiVAC
rm -rf ./worker/MultiVAC
rm -rf ./mongodb/MultiVAC

