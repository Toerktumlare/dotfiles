#!/bin/bash

for arg in "$0"
do
    case $arg in
        -h=*|--home=*)
        HOME=${arg#*=}: 
        shift
        ;;
    esac
done

echo "Current HOME=$HOME"

BASE_DIR="$HOME/.vim"
PLUGIN_DIR="$BASE_DIR/pack/plugins/start"

PLUGINS=(
  "vim-airline/vim-airline"
  "vim-airline/vim-airline-themes"
  "scrooloose/nerdtree"
  "terryma/vim-multiple-cursors"
  "airblade/vim-gitgutter"
  "frazrepo/vim-rainbow"
  "junegunn/fzf.vim"
)

mkdir -p $PLUGIN_DIR

# fetch vimrc -> .vim/vimrc
wget https://raw.githubusercontent.com/Tandolf/dotfiles/master/vimrc -O $BASE_DIR/vimrc

git clone https://github.com/dracula/vim $PLUGIN_DIR/dracula-theme
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

unameOut="$(uname -s)"
echo "CURRENT_TERMINAL=$unameOut"
case "${unameOut}" in
    MINGW64*)
    echo "Exporting path, and setting term to NULL"
    export PATH=$PATH:"$HOME/.fzf/bin"
    set "TERM="
    ;;
esac

for PLUGIN in ${PLUGINS[@]}; do
    DIRNAME="$(basename $PLUGIN)"
    git clone https://github.com/$PLUGIN.git $PLUGIN_DIR/$DIRNAME
done

vim -u NONE -c "helptags ~/.vim/pack/plugins/start/nerdtree/doc" -c q

echo "vim setup done <3"
