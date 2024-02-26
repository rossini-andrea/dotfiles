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

# Opens Sway as a subcompositor to explore source code in $PWD
function swayfz
    set -lx NVIM_SERVER_PIPE /tmp/.nvimp.(string sub -l 32 (echo $PWD | md5sum)).sock
    nohup sway --config ( \
        echo \
	    "include ~/.config/sway/subcompositor.conf
	    exec alacritty -T Files -e fish -c fzfvim
	    exec alacritty -e nvim --listen" $NVIM_SERVER_PIPE \
    | psub) &> /dev/null & disown
end

# Open documents in a running nvim server, if running.
# Otherwise opens nvim in a new terminal.
function nvimsrv
    if socat -u OPEN:/dev/null UNIX-CONNECT:$NVIM_SERVER_PIPE
        nvim --server $NVIM_SERVER_PIPE --remote $argv
    else
        nohup alacritty -e nvim --listen $NVIM_SERVER_PIPE $argv &> /dev/null & disown
    end
end

# Runs fzf as a source code explorer.
function fzfvim
    fzf --bind \
        "enter:execute(nvimsrv {})"
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

# Prompt
starship init fish | source

