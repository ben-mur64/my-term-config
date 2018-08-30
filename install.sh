#!/bin/bash

sudo apt install vim -y &&
sudo apt install cmake -y &&
sudo apt install build-essential -y &&
sudo apt install python -y &&
sudo apt install python-dev -y &&
sudo apt install python3-dev -y

mkdir ~/.vim
cp .vimrc ~/.vim/.vimrc
cp .bashrc ~/.bashrc
cp .dircolors ~/.dircolors

echo "source ~/.vim/.vimrc" > ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

cd ~
echo 'Restart bash for changes to take effect'
