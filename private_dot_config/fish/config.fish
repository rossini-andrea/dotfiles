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

# Aliases

alias ls "ls --color=auto"
alias code "codium"
alias st-term "pyserial-miniterm --eol LF -e /dev/ttyACM0 115200"

# Prompt

starship init fish | source
