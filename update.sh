#!/usr/bin/env bash

# init
cd /workspaces
rm -rf vscode seti-ui

# clone
git clone https://github.com/microsoft/vscode --depth 1
git clone https://github.com/jesseweed/seti-ui --depth 1

# init vscode
cd /workspaces/vscode
git remote add adaex https://adaex:${AEX_TOKEN}@github.com/adaex/vscode
git checkout -b update-seti-ui
yarn

# build seti-ui
cd /workspaces/seti-ui
npm ci
npm run prepublishOnly

# update vscode
cd /workspaces/vscode/extensions/theme-seti
npm run update

git add .
git commit -m "Update to latest seti-ui icon theme"
git push adaex

# open for preview
code /workspaces/vscode/extensions/theme-seti