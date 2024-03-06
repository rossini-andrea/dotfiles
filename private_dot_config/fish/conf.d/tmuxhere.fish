# Functions and aliases to use inside tmux

# Opens tmux to explore source code in $PWD
function tmuxhere
    tmux new-session -A -s "$PWD" -c $PWD _tmuxhere_start
end

# Runs inside tmux, setting the environment
function _tmuxhere_start
    set -l pwdmd5 (string sub -l 32 (echo $PWD | md5sum))
    set -lx NVIM_SERVER_PIPE /tmp/.nvimt.$pwdmd5.sock
    tmux setenv -t "$PWD" NVIM_SERVER_PIPE $NVIM_SERVER_PIPE 
    fzfp
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


