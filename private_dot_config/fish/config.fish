# Functions
function fish_greeting
    begin
        date
        figlet '    WELCOME !'
        echo (fish --version)\t\t(cat /proc/meminfo | grep MemAvailable | cut -c 14-) free
    end | lolcat
end

function swappiness
    sudo sysctl -w vm.swappiness=$argv
end

# PATH
set PATH $PATH $HOME/bin $HOME/.local/bin

set -x EDITOR /usr/bin/nvim 
set -x VISUAL $EDITOR

# Aliases
alias ls "ls --color=auto"
alias code "codium"
alias gallery "sxiv -r ."
alias st-term "pyserial-miniterm --eol LF -e /dev/ttyACM0 115200"
alias gitlog "git log --pretty=format:'%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(yellow)%d%C(reset)' --graph --decorate --all --full-history"

# Prompt
starship init fish | source

