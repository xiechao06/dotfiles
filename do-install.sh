#!/usr/bin/env bash

trap 'exit' ERR

# Let me run anywhere!
DOTFILES_DIR="$(cd $( dirname "$0" ) && pwd )"
echo $DOTFILES_DIR

TS="$(date +%Y%m%d%H%M%S)"

[ -d ~/.i3 ] && mv ~/.i3 ~/.i3."$TS".backup
ln -sfv "$DOTFILES_DIR/i3" ~/.i3
[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig."$TS".backup
ln -sfv "$DOTFILES_DIR/gitconfig" ~/.gitconfig
[ -f ~/.i3status.conf ] && mv ~/.i3status.conf ~/.i3status.conf."$TS".backup
ln -sfv "$DOTFILES_DIR/i3status.conf" ~/.i3status.conf
[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf."$TS".backup
ln -sfv "$DOTFILES_DIR/tmux.conf" ~/.tmux.conf

git submodule update --init --recursive --remote
[ ! -d ~/.vim ] && ln -sfv "$DOTFILES_DIR/.cache/vim" ~/.vim
$DOTFILES_DIR/.cache/vim/install.sh

if [ -n "$(getent group sudo | grep $(whoami))" ]; then
    . "$DOTFILES_DIR/install/apt-use-mirror.sh"
    sudo apt update
    sudo apt install -y \
        vim inkscape zathura spacefm silversearcher-ag tmuxinator i3 \
        git postgresql feh xautolock xbacklight gimp scrot
    pip3 install --user joe
fi

. "$DOTFILES_DIR/install/fzf"
