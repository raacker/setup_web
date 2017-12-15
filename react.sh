#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "Please run with sudo"
	exit 1
fi

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

apt-get update && sudo apt-get install -y yarn

yarn add create-react-app
