function nvimpane -d "Open documents in a running nvim server, if running. Otherwise opens nvim in a new tmux pane"
    if socat -u OPEN:/dev/null UNIX-CONNECT:$NVIM_SERVER_PIPE
        nvim --server $NVIM_SERVER_PIPE --remote $argv
        tmux selectw -t "main-editor"
    else
        tmux neww -n "main-editor" nvim --listen $NVIM_SERVER_PIPE $argv
    end
end

