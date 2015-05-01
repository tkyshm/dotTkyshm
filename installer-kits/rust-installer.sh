#!/bin/bash
echo -n -e "Do you install rust?(y/n): "
read ok_flag
if [ "$ok_flag" = "y" ] ; then 
  curl -f -L https://static.rust-lang.org/rustup.sh -O
  sudo sh rustup.sh
fi

