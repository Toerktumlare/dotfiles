#!/bin/bash

## find report_text folder, search from users home folder
TEX_SOURCE=$(find $HOME -name "report_tex")
TEX_CONTAINER_SOURCE=$(find $HOME -name "latex_container")

source=${1:-${TEX_SOURCE}} ## if found set to source 
target=${2:-${PWD}} ## use current dir as destination

if [ "$source" = "" ]; then ## if report_tex folder not found then print error    
    echo "Could not find report_tex folder, have you checked out the repo?" >&2; exit 1
fi

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

copy_latex_files() {
    ## files to copy
    declare -a files=("truesec_report.cls" "footer_stockholm.tex" "fonts" "TrueSec_New_Logotype_2017_BLACK.eps" "examples/report_example/introduction" "examples/report_example/report.tex" ".gitignore" "truesec_report-swedish.trsl")

    ## copy and print
    for file in "${files[@]}"
    do
        cp -fR "${source}/${file}" ${target}
    done
    echo "Copied LaTeX report files to target."
}

copy_container_files
copy_latex_files
