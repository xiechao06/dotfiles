#!/usr/bin/env bash

trap 'exit' ERR

# Let me run anywhere!
DOTFILES_DIR="$(cd $( dirname "$0" ) && pwd )"
echo $DOTFILES_DIR

[ ! -d ~/.i3 ] && ln -sfv "$DOTFILES_DIR/i3" ~/.i3
ln -sfv "$DOTFILES_DIR/gitconfig" ~/.gitconfig
ln -sfv "$DOTFILES_DIR/i3status.conf" ~/.i3status.conf
ln -sfv "$DOTFILES_DIR/tmux.conf" ~/.tmux.conf
ln -sfv "$DOTFILES_DIR/xinitrc" ~/.xinitrc

git submodule update --init --recursive --remote
[ ! -d ~/.vim ] && ln -sfv "$DOTFILES_DIR/.cache/vim" ~/.vim
$DOTFILES_DIR/.cache/vim/install.sh

if [ -n "$(getent group sudo | grep $(whoami))" ]; then
    . "$DOTFILES_DIR/install/apt-use-mirror.sh"
    sudo apt update
    sudo apt install -y \
        vim inkscape zathura spacefm silversearcher-ag tmuxinator i3 \
        git postgresql feh xautolock xbacklight
fi

. "$DOTFILES_DIR/install/fzf"
