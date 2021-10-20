#!/usr/bin/env bash

cd /workspaces

rm -rf vscode seti-ui

git clone https://github.com/jesseweed/seti-ui
git clone https://github.com/microsoft/vscode

cd /workspaces/seti-ui
npm ci
npm run prepublishOnly

cd /workspaces/vscode
git remote add adaex https://adaex:${AEX_TOKEN}@github.com/adaex/vscode
git checkout -b update-seti-ui
yarn

cd /workspaces/vscode/extensions/theme-seti
npm run update

git add .
git commit -m "Update to latest seti-ui icon theme"
git push adaex