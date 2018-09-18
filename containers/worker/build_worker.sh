#!/bin/bash

cp -r ../../MultiVAC .
docker build -t multivac_worker:v1 . && rm -rf Multivac

