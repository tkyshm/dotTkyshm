#!/bin/bash
# rbenv configuration
echo -e "\e[34m[INFO] Start installation of rbenv.\e[39m"
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/jf/rbenv-gemset.git ~/.rbenv/plugins/rbenv-gemset


