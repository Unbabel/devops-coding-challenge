#!/bin/bash

cp -r ../../MultiVAC .
docker build -t multivac_server:v1 . && rm -rf Multivac


