# Functions and aliases to use inside tmux

# Opens Sway as a subcompositor to explore source code in $PWD
function tmuxhere
    set -lx NVIM_SERVER_PIPE /tmp/.nvimt.(string sub -l 32 (echo $PWD | md5sum)).sock
    tmux new-session -A -s "$PWD" -c $PWD fzfp
end

# Open documents in a running nvim server, if running.
# Otherwise opens nvim in a new tmux pane.
function nvimpane
    if socat -u OPEN:/dev/null UNIX-CONNECT:$NVIM_SERVER_PIPE
        nvim --server $NVIM_SERVER_PIPE --remote $argv
    else
        tmux splitw -h nvim --listen $NVIM_SERVER_PIPE $argv
    end
end

# Runs fzf as a source code explorer.
function fzfp
    fzf --bind \
        "enter:execute(nvimpane {})"
end


