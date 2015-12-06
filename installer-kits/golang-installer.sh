#!/bin/bash
## Install golang
go_version="1.5.1"
echo -e "\e[32m Do you want to install golang? (y/n) > "
while :
do
  read select
  case $select in
    'Y' | [yY]es | "y" )
      wget -N https://storage.googleapis.com/golang/go${go_version}.linux-amd64.tar.gz
      sudo mv go${go_version}.linux-amd64.tar.gz /usr/local
      cd /usr/local/
      sudo tar -xvf go${go_version}.linux-amd64.tar.gz
      #export GOROOT=/usr/local/go
      #export GOPATH=$HOME/gocode
      #export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
      #echo "export GOROOT=/usr/local/go" >> .zshrc.mine
      #echo "export GOPATH=$HOME/gocode" >> .zshrc.mine
      #echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> .zshrc.mine
      #source ~/.zshrc
      go get github.com/nsf/gocode
      exit 1
      ;;
    "n" | "N" | [Nn]o )
      break
      ;;
    *)
      echo -e "\e[31m[Error] Wrong input. Please y/n input.\e[39m"
      ;;
  esac
done

