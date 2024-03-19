# Functions and aliases to use inside tmux
# Opens tmux to explore source code in $PWD
function tmuxhere -a folder -d "Opens tmux to explore source code in working dir or input folder"
    if test -z "$folder"
        set -f folder $PWD
    end

    set -f folder (path resolve $folder)
    set -f session (string replace -r -a '[\.\:]' '_' $folder)

    if test -z "$TMUX"
        tmux new-session -A -s $session -c $folder _tmuxhere_start
    else
        tmux new-session -d -s $session -c $folder _tmuxhere_start
        tmux switch -t $session
    end
end

  # Runs inside tmux, setting the environment
function _tmuxhere_start
    set -l pwdmd5 (string sub -l 32 (echo $PWD | md5sum))
    set -lx NVIM_SERVER_PIPE /tmp/.nvimt.$pwdmd5.sock
    tmux setenv -t "$PWD" NVIM_SERVER_PIPE $NVIM_SERVER_PIPE 
    nvimpane
    fish
end

# Open documents in a running nvim server, if running.
# Otherwise opens nvim in a new tmux pane (I am currently
# experimenting in anotehr window)
function nvimpane
    if socat -u OPEN:/dev/null UNIX-CONNECT:$NVIM_SERVER_PIPE
        nvim --server $NVIM_SERVER_PIPE --remote $argv
        tmux selectw -t "main-editor"
    else
        tmux neww -n "main-editor" nvim --listen $NVIM_SERVER_PIPE $argv
    end
end

# Runs fzf as a source code explorer.
function fzfp
    fzf --bind \
        "enter:execute(nvimpane {})"
end

alias tmh tmuxhere

