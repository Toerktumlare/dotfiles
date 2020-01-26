# Dotfiles
The way i like stuff setup.

## Windows

### Pre-requisites
Chocolatey [https://chocolatey.org/install](https://chocolatey.org/install)

Git `cinst git -y`

### Run
```
    git clone https://github.com/Tandolf/dotfiles ~/code
    cd ~/code/dotfiles/bin
    ./build.ps1 @{'git_global_name'="your_username";'git_global_email'="your_email@gmail.com"}
```

## Linux

### Run
```
    git clone https://github.com/Tandolf/dotfiles ~/code
    cd ~/code/dotfiles/bin
    ./vim-setup.sh
```
