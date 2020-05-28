#!/bin/bash

# dotfiles directory path
dotfiles_dir=~/dotfiles

usage() {
    echo "Usage: $0 [bashrc|i3|onedrive|profile|util|vim|Xresources|zsh]"
    exit 1
}

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    usage
fi

while [[ $# -gt 0 ]]; do
    case "$1" in
        bashrc)
            rm -rf ~/.bashrc > /dev/null 2>&1
            ln -sf $dotfiles_dir/.bashrc ~/.bashrc
            rm -rf ~/.aliases > /dev/null 2>&1
            ln -sf $dotfiles_dir/.aliases ~/.aliases
            ;;
        onedrive)
            rm -rf ~/.config/onedrive > /dev/null 2>&1
            rm -rf ~/.config/onedrive_ucy > /dev/null 2>&1

            ln -sf $dotfiles_dir/.config/onedrive ~/.config/onedrive
            ln -sf $dotfiles_dir/.config/onedrive_ucy ~/.config/onedrive_ucy
            ;;
        profile)
            rm -rf ~/.profile > /dev/null 2>&1
            ln -sf $dotfiles_dir/.profile ~/.profile
            ;;
        util)
            cat util.list | xargs sudo apt-get -y install
            rm -rf ~/.tmux.conf > /dev/null 2>&1
            ln -sf $dotfiles_dir/.tmux.conf ~/.tmux.conf
            ;;
        vim)
            sudo apt-get -y install vim
            git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
            git clone https://github.com/ghadj/vim-snippets.git ~/

            rm -rf ~/.vimrc > /dev/null 2>&1
            ln -sf $dotfiles_dir/.vimrc ~/.vimrc
            echo "intall vim plugins using :PluginInstall in vim"
            ;;
        Xresources)
            rm -rf ~/.Xresources > /dev/null 2>&1
            ln -sf $dotfiles_dir/.Xresources ~/.Xresources
            ;;
        zsh)
            sudo apt-get -y install zsh
            # install ohmyzsh
            sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            rm -rf ~/.zshrc > /dev/null 2>&1
            ln -sf $dotfiles_dir/.zshrc ~/.zshrc
            rm -rf ~/.aliases > /dev/null 2>&1
            ln -sf $dotfiles_dir/.aliases ~/.aliases
            ;;
        *)
            echo "Unknown argument: $1"
            usage
            ;;
    esac
    echo "Successfull setup of $1."
    shift
done
