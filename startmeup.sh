#!/usr/bin/env bash

# script assumes that repository directory is located at ~/pearsonal/devenv
cd
ln -s pearsonal/devenv/bash_profile .bash_profile

# ensure XCode is installed (https://stackoverflow.com/questions/30533039/verify-xcode-command-line-tools-install-in-bash-script)
check=$((xcode-\select --install) 2>&1)
echo $check
str="xcode-select: note: install requested for command line developer tools"
while [[ "$check" == "$str" ]];
do
  osascript -e 'tell app "System Events" to display dialog "xcode command-line tools missing." buttons "OK" default button 1 with title "xcode command-line tools"'
  exit;  
done

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install python and its friends (courtesy of http://www.pyladies.com/blog/Get-Your-Mac-Ready-for-Python-Programming/)
brew install python
curl -O http://python-distribute.org/distribute_setup.py
python distribute_setup.py
curl -O https://raw.github.com/pypa/pip/master/contrib/get-pip.py
python get-pip.py

# install virtualenv
pip install virtualenv

# install git
brew install git
git config --global user.email "pearsonhenri@gmail.com"
git config --global user.name "Pearson Henri"
