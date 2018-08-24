#!/usr/bin/env bash

print_fail() {
  printf '%b' "\033[31m [FAIL] \033[0m$1\n"
}

print_success() {
  printf '%b' "\033[32m [OK] \033[0m$1\n"
}


_is_GNU_linux64(){
  architecture=`uname -p`
  os=`uname -o`
  result=1 #false
  if  [ "${architecture}" == "x86_64" ] && [ "${os}" == "GNU/Linux" ] ; then
    result=0 #true
  fi
  return ${result}
}

update_packages(){
  echo "Updating Packages"
  sudo apt-get update
  print_success "Packages Updated"
}

preflight_checks(){
  echo "Verifying System"
  if ! _is_GNU_linux64 ; then
    print_fail "This script works only for GNU/Linux x64 platforms."
    return 1
  fi
}