#!/bin/bash

# dotfiles directory path
dotfiles_dir=~/dotfiles

# Delete existing dot files and folders
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.profile > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.Xresources > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1

sudo rm -rf ~/.config/dunst > /dev/null 2>&1
sudo rm -rf ~/.config/i3 > /dev/null 2>&1
sudo rm -rf ~/.config/i3status > /dev/null 2>&1
sudo rm -rf ~/.config/onedrive > /dev/null 2>&1
sudo rm -rf ~/.config/onedrive_ucy > /dev/null 2>&1

# Create symbolic links in the home directory
ln -sf $dotfiles_dir/.bashrc ~/.bashrc
ln -sf $dotfiles_dir/.profile ~/.profile
ln -sf $dotfiles_dir/.tmux.conf ~/.tmux.conf
ln -sf $dotfiles_dir/.vimrc ~/.vimrc
ln -sf $dotfiles_dir/.Xresources ~/.Xresources
ln -sf $dotfiles_dir/.zshrc ~/.zshrc

ln -sf $dotfiles_dir/.config/dunst ~/.config/dunst
ln -sf $dotfiles_dir/.config/i3 ~/.config/i3
ln -sf $dotfiles_dir/.config/i3status ~/.config/i3status
ln -sf $dotfiles_dir/.config/onedrive ~/.config/onedrive
ln -sf $dotfiles_dir/.config/onedrive_ucy ~/.config/onedrive_ucy
