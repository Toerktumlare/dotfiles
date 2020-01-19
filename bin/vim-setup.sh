#!/bin/bash

BASE_DIR="$HOME/.vim"
PLUGIN_DIR="$BASE_DIR/pack/plugins/start"

PLUGINS=(
  "vim-airline/vim-airline"
  "vim-airline/vim-airline-themes"
  "scrooloose/nerdtree"
)

mkdir -p $PLUGIN_DIR

# fetch vimrc -> .vim/vimrc
wget https://raw.githubusercontent.com/Tandolf/dotfiles/master/vimrc -O $BASE_DIR/vimrc

git clone https://github.com/dracula/vim $PLUGIN_DIR/dracula-theme

for PLUGIN in ${PLUGINS[@]}; do
    DIRNAME="$(basename $PLUGIN)"
    git clone https://github.com/$PLUGIN.git $PLUGIN_DIR/$DIRNAME
done

vim -u NONE -c "helptags ~/.vim/pack/plugins/start/nerdtree/doc" -c q

echo "vim setup done <3"

