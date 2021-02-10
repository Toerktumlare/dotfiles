alias ls='exa'
alias ll='exa -laF'
alias vim='nvim'

 if test -e /usr/bin/dircolors
     test -r ~/.dircolors && eval (dircolors -c ~/.dircolors) || eval (dircolors -c)

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
 end

 # display full directory names in prompt
 set fish_prompt_pwd_dir_length 0
