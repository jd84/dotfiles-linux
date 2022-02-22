#!bin/bash

dconf dump /org/mate/terminal/profiles/profile0/ > ~/.dotfiles/profile0.mtconf
dconf dump /org/mate/terminal/global/ > ~/.dotfiles/global.mtconf
