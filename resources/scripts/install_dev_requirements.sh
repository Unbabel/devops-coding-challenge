#!/usr/bin/env bash
source ./utils.sh

# from utils
preflight_checks
update_packages

deps=(
  autoconf
  autoconf-archive
  automake
  build-essential
  g++
  gcc
  git
  libcmocka-dev
  libcmocka0
  libgcrypt20-dev
  libssl-dev
  libtool
  liburiparser-dev
  lnav
  m4
  pkg-config
)

sudo apt-get install -y ${deps[@]}

curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

cat << EOF >> ~/.bash_profile
export PATH="$HOME/.pyenv/bin:$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
EOF

source ~/.bash_profile
sudo pyenv install 3.6.5
sudo pyenv global 3.6.5

pip install pipenv