#!/bin/bash
# kerl install
echo -e "\e[32m Do you want to install erlang? (y/n) > "
while :
do
  read select
  case $select in
    'Y' | [yY]es | "y" )
      curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
      mkdir ~/bin
      mv kerl ~/bin
      chmod a+x ~/bin/kerl
      echo 'KERL_CONFIGURE_OPTIONS="--disable-hipe --enable-smp-support --enable-threads --enable-kernel-poll" ' > ~/.kerlrc

      ~/bin/kerl list releases 
      ~/bin/kerl update releases 
      ~/bin/kerl build 18.1 18.1
      ~/bin/kerl install 18.1 ~/erlang/18.1
      . ~/erlang/18.1/activate
      break
      ;;
    "n" | "N" | [Nn]o )
      break
      ;;
    *)
      echo -e "\e[31m[Error] Wrong input. Please y/n input.\e[39m"
      ;;
  esac
done
