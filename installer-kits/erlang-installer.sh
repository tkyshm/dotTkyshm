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
      ~/bin/kerl build 17.3 17.3
      ~/bin/kerl install 17.3 ~/erlang/17.3
      ~/bin/kerl build 17.5 17.5
      ~/bin/kerl install 17.3 ~/erlang/17.5
      . ~/erlang/17.3/activate
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
