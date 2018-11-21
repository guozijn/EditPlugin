#!/usr/bin/env sh

REAL_PATH=$(python -c "import os,sys;print os.path.realpath('$0')")
DIR_NAME=$(dirname "$REAL_PATH")
yes | cp -rf $DIR_NAME/.vim* $HOME
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Install vundle ..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
