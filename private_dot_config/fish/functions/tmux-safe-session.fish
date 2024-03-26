function tmux-safe-session -d "Safely opens a new tmux session, or attaches to the session if it already exists. The command can be run inside tmux"
    argparse "s/session=" "c/cwd=" -- $argv
    or return

    if test -z "$TMUX"
        tmux new-session -A -s $_flag_session -c $_flag_cwd $argv
    else
        tmux new-session -d -s $_flag_session -c $_flag_cwd $argv
        tmux switch -t $_flag_session
    end
end
