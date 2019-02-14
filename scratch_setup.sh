#!/bin/sh

# macOS only, tested on 10.14,3
#brew install node

# Debian only, tested on Phicomm N1, ARMBIAN 5.62 user-built Debian GNU/Linux 9 (stretch) 4.18.7-aml-s9xxx
sudo curl -sL https://deb.nodesource.com/setup_11.x -o node_setup.sh
sudo chmod +x node_setup.sh
sudo ./node_setup.sh
sudo apt-get install -y nodejs

# Check and prepare
#node -v
sudo npm install -g yarn
sudo npm install -g webpack
sudo npm install -g webpack-dev-server

# macOS only
#mkdir -p ~/Sites/Scratch
#cd ~/Sites/Scratch

# Checkout
git clone https://github.com/Yonsm/scratch-vm
#git remote add upstream git@github.com:LLK/scratch-vm.git
#git fetch --all
#git rebase upstream/develop
#git push origin -f

git clone https://github.com/Yonsm/scratch-gui
#git remote add upstream git@github.com:LLK/scratch-gui.git
#git fetch --all
#git rebase upstream/develop
#git push origin -f

#
cd scratch-vm
nano src/extensions/scratch3_homeassistant/index.js # Replace _wsapi and _token with your own's
yarn install
yarn link
yarn add uglifyjs-webpack-plugin
yarn run watch # Press Ctrl+C on ready
cd ..

#
cd scratch-gui
yarn install
yarn link scratch-vm
webpack-dev-server --disable-host-check # Access http://localhost:8601
