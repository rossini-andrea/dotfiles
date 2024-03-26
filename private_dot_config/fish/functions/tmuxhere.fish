
function tmuxhere -a folder -d "Opens tmux to explore source code in working dir or input folder"
    if test -z "$folder"
        set -f folder $PWD
    end

    set -f folder (path resolve $folder)
    set -f session (string replace -r -a '[\.\:]' '_' $folder)

    tmux-safe-session -s $session -c $folder "fish -c tmuxhere_start"
end

