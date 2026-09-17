#!/bin/bash

echo "[INFO] pulling latest changes"
git pull
echo "[INFO] copying config files"
mkdir -p ~/.config/nvim
cp -r nvim ~/.config/
