#!/bin/bash

BASE_DIR="$HOME/.vim"
PLUGIN_DIR="$BASE_DIR/pack/plugins/start"

PLUGINS=(
  "vim-airline/vim-airline"
  "vim-airline/vim-airline-themes"
)

mkdir -p $PLUGIN_DIR

wget https://raw.githubusercontent.com/tandolf/dotfiles/master/.vimrc -O $HOME/.vimrc

git clone https://github.com/dracula/vim $PLUGIN_DIR/dracula-theme

for PLUGIN in ${PLUGINS[@]}; do
    DIRNAME="$(basename $PLUGIN)"
    git clone https://github.com/$PLUGIN.git $PLUGIN_DIR/$DIRNAME
done

echo "vim setup done <3"

