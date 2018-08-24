#!/usr/bin/env bash
source ./utils.sh

# from utils
preflight_checks

ubuntu_release=$(lsb_release -cs)

sudo apt-key adv \
    --keyserver hkp://keyserver.ubuntu.com:80  \
    --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu $ubuntu_release/mongodb-org/4.0 multiverse" | \
    sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

# from utils
update_packages

sudo apt-get install -y mongodb-org
