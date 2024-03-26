function projexp -d "Chooses preferred projects form configurable lists. ~/.projexp.paths and ~/.projexp.pins"
    begin
        cat ~/.projexp.paths |
        begin
            while read -l line
                echo (fish -c "path resolve "$line)/*/
            end
        end | xargs ls -d
        cat ~/.projexp.pins |
        begin
            while read -l line
                if test -n $line
                    echo (fish -c "path resolve "$line)
                end
            end
        end
    end | not-fuzf \
        --header "Select a project to open a tmux session" \
        --bind "enter:execute(tmuxhere {})"
end

