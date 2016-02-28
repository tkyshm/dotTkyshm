#!/bin/bash
set -e
echo -n -e "Do you install rust?(y/n): "
read ok_flag
if [ "$ok_flag" = "y" ] ; then 
    curl -sSf https://static.rust-lang.org/rustup.sh | sh
fi
mkdir -p $HOME/src
cd $HOME/src
