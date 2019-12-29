cat packages.list | xargs sudo apt-get -y install

# install vundle vim plugin-manager
# Reference: https://github.com/VundleVim/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
