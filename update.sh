#!/usr/bin/env bash

rm -rf vscode seti-ui
git clone https://github.com/microsoft/vscode --depth 1
git clone https://github.com/jesseweed/seti-ui --depth 1

cd seti-ui
npm ci
npm run prepublishOnly

cd ../vscode
yarn
cd extensions/theme-seti
npm run update
