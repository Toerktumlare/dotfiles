#!/bin/bash

## find report_text folder, search from users home folder
TEX_CONTAINER_SOURCE=$(find $HOME -name "latex_container")

target=${1:-${PWD}} ## use current dir as destination

copy_container_files() {

    if [ "$TEX_CONTAINER_SOURCE" = "" ]; then
        echo "WARNING: could not find latex_container folder, no devcontainer support will be avaliable"
    else
        mkdir -p "${target}/.devcontainer"
        mkdir -p "${target}/.vscode"
        cp -fR "${TEX_CONTAINER_SOURCE}/.devcontainer/." "${target}/.devcontainer"
        cp -fR "${TEX_CONTAINER_SOURCE}/.vscode/." "${target}/.vscode"
        echo "Copied devcontainer files to target."
    fi
}

copy_container_files
