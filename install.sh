#!/bin/sh

# Let me run anywhere!
DOTFILES_DIR="$(cd $( dirname "$0" ) && pwd )"
echo $DOTFILES_DIR

ln -sfv "$DOTFILES_DIR/.vimrc" ~
ln -sfv "$DOTFILES_DIR/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/.i3" ~
ln -sfv "$DOTFILES_DIR/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/.i3status.conf" ~
ln -sfv "$DOTFILES_DIR/.tmuxinator" ~

sudo apt update
sudo apt install -y vim inkscape zathura 
