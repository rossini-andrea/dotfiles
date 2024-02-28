# Weird experiment to turn Sway into a subcompositor IDE.
# Should I learn tmux instead? :/

# Opens Sway as a subcompositor to explore source code in $PWD
function swayfz
    set -lx NVIM_SERVER_PIPE /tmp/.nvimp.(string sub -l 32 (echo $PWD | md5sum)).sock
    nohup sway --config ( \
        echo \
	    "include ~/.config/sway/subcompositor.conf
	    exec alacritty -T Files -e fish -c fzfvim" \
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


