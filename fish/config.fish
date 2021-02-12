# check if exa exists otherwise use ls
if command -v exa > /dev/null
    abbr -a ls 'exa'
    abbr -a ll 'exa -laF'
else
    abbr -a l 'ls'
    abbr -a ll 'ls -laF'
end

abbr -a vim 'nvim'

 # display full directory names in prompt
 set fish_prompt_pwd_dir_length 0

 set PATH $PATH /bin/snap
