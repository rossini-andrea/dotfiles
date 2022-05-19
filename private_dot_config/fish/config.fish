# Functions
function fish_greeting
    echo
    echo WELCOME !
end

function swappiness
    sudo sysctl -w vm.swappiness=$argv
end

# PATH
set PATH $PATH $HOME/bin $HOME/.local/bin

set -x EDITOR ~/bin/kakwrapper
set -x VISUAL $EDITOR

# Aliases

alias ls "ls --color=auto"
alias code "codium"
alias gallery "sxiv -r ."
alias st-term "pyserial-miniterm --eol LF -e /dev/ttyACM0 115200"
alias gitlog "git log --pretty=format:'%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(yellow)%d%C(reset)' --graph --decorate --all"

# Prompt

starship init fish | source
