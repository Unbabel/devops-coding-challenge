#!/bin/bash
#
# MAINTAINER: Rui Grafino
# DATE: 19/09/2018
# VERSION: v1.0


cp -r ../../MultiVAC .

CONTAINER_REGISTRY="registry.gitlab.com/ruigrafino/project"
CONTAINER_NAME="multivac-worker"
CONTAINER_VERSION="v1"
CONTAINER_LOCAL="${CONTAINER_NAME}:${CONTAINER_VERSION}"
CONTAINER_REPO="${CONTAINER_REGISTRY}/${CONTAINER_NAME}:${CONTAINER_VERSION}"

docker build -t ${CONTAINER_LOCAL} .
docker build -t ${CONTAINER_REPO} . && docker push ${CONTAINER_REPO} && rm -rf MultiVAC
