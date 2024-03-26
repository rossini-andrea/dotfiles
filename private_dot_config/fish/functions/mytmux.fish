function mytmux -d "Opens a default tmux session"
    argparse t/secondstage -- $argv
    or return

    if test -n "$_flag_secondstage"
        tmux split-window -v -- fish -c projexp

        if type -q pwsh.exe
            # We are on work laptop... Add a Windows shell
            # WINHOME is declared on an untracked file
            tmux neww -n "Powershell" -c $WINHOME pwsh.exe
        end

        exec fish
    end

    set -f session "Default Session"
    tmux-safe-session -s $session -c ~ -- fish -c "mytmux --secondstage"
end

