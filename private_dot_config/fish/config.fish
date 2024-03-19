# Functions
function fish_greeting
    begin
        clear
        date
        figlet '    WELCOME !'
        echo (fish --version)\t\t(cat /proc/meminfo | grep MemAvailable | cut -c 14-) free
    end | lolcat
end

function swappiness
    sudo sysctl -w vm.swappiness=$argv
end

function gitshow
    set -l commit (echo $argv | sed -r -E 's/^[ \\\/\|\*]*([0-9a-f]*) .*$/\1/g')
    #set -l pager_command "/usr/bin/fzf --ansi --no-sort --layout=reverse-list"
    set -l pager_command "/usr/bin/nvim -R"
    set -lx GIT_PAGER $pager_command
    git show --no-color $commit
end

function gitlog
    set -l pager_command "/usr/bin/fzf --ansi --no-sort --layout=reverse-list"
    set -l show_command "--bind \"enter:execute(gitshow {})\""

    set -lx GIT_PAGER $pager_command" "$show_command
    git log \
        --pretty=format:'%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(yellow)%d%C(reset)' \
        --date=iso \
        --graph --decorate --all --full-history
end

function mytmux -d "Opens a default tmux session"
    if type -q pwsh.exe
        # We are on work laptop... I need a Windows shell
        set -f extras neww -n "Powershell" -c $WINHOME pwsh.exe
    end

    tmux new-session -A -s "Default Session" -c ~ \; \
        split-window -v -- fish -c projexp \; \
        $extras
end

# PATH
set PATH $PATH $HOME/bin $HOME/.local/bin

# ENVIRONMENT
set -x EDITOR /usr/bin/nvim 
set -x VISUAL $EDITOR
set -x FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"

# Aliases
alias ls "ls --color=auto"
alias code "codium"
alias gallery "sxiv -r ."
alias st-term "pyserial-miniterm --eol LF -e /dev/ttyACM0 115200"

# Prompt
starship init fish | source

