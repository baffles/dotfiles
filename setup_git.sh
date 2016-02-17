#!/bin/bash

read -p "Git user.name: "
git config --global user.name "$REPLY"

read -p "Git user.email: "
git config --global user.email "$REPLY"

echo Configuring aliases...
git config --global alias.co checkout
git config --global alias.st status

echo push.default = simple...
git config --global push.default simple

echo Done
