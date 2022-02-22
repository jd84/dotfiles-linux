#!/bin/bash
@echo off
WORK_DIR="$HOME/.dotfiles"
mkdir -p $WORK_DIR
cd $WORK_DIR

# prepare homeing directory to preload configs
curl -O https://raw.githubusercontent.com/jd84/dotfiles-linux/master/bash/.bash_aliases
curl -O https://raw.githubusercontent.com/jd84/dotfiles-linux/master/bash/.bashrc
curl -O https://raw.githubusercontent.com/jd84/dotfiles-linux/master/tmux/.tmux.conf

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-fish --no-zsh

# create RSA keypair for persistence over SSH
mkdir -p ~/.ssh
ssh-keygen -t rsa -f ./ssh/id_rsa

# install tmux 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install fonts
font_dir="$HOME/.local/share/fonts"
mkdir -p $font_dir
wget https://github.com/powerline/fonts/raw/master/Cousine/Cousine%20for%20Powerline.ttf -O "$HOME/.local/share/fonts/Cousine for Powerline.ttf"

# refresh font cache
if which fc-cache >/dev/null 2>&1 ; then
	fc-cache -f "$font_dir"
fi

# get terminal settings
curl -O https://raw.githubusercontent.com/jd84/dotfiles-linux/master/mate-terminal/profile0.mtconf
curl -O https://raw.githubusercontent.com/jd84/dotfiles-linux/master/mate-terminal/global.mtconf
curl -O https://raw.githubusercontent.com/jd84/dotfiles-linux/master/mate-terminal/import-mate-terminal.sh
curl -O https://raw.githubusercontent.com/jd84/dotfiles-linux/master/mate-terminal/export-mate-terminal.sh 
chmod +x import-mate-terminal.sh
chmod +x export-mate-terminal.sh

# copy all the stuff
cp .bashrc ~/.bashrc
cp .bash_aliases ~/.bash_aliases
cp .tmux.conf ~/.tmux.conf
