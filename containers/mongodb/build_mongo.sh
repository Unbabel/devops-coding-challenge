#!/bin/bash
#
# MAINTAINER: Rui Grafino
# DATE: 19/09/2018
# VERSION: v1.0


CONTAINER_REGISTRY="registry.gitlab.com/ruigrafino/project"
CONTAINER_NAME="multivac-mongo"
docker build -t "${CONTAINER_NAME}" .
docker build -t "${CONTAINER_REGISTRY}:${CONTAINER_NAME}" . && docker push "${CONTAINER_REGISTRY}:${CONTAINER_NAME}"
