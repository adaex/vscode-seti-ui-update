#!/usr/bin/env bash

cd /workspaces

if [ ! -d /workspaces/seti-ui ]; then
  git clone https://github.com/jesseweed/seti-ui
fi

if [ ! -d /workspaces/vscode ]; then
  git clone https://github.com/microsoft/vscode
fi

cd /workspaces/seti-ui
npm ci
npm run prepublishOnly

cd /workspaces/vscode
yarn
cd /workspaces/vscode/extensions/theme-seti
npm run update
