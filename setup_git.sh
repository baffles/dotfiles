#!/bin/bash

read -p "Git user.name: "
git config --global user.name "$REPLY"

read -p "Git user.email: "
git config --global user.email "$REPLY"

read -p "Git config (gitconfig / gitconfig_osx): "
git config --global "$PWD/git/$REPLY"

echo Done
