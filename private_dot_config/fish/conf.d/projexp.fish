function projexp -d "Chooses preferred projects form configurable lists. ~/.projexp.paths and ~/.projexp.pins"
    begin
        cat ~/.projexp.paths |
        begin
            while read -l line
                echo (path resolve $line)/*/
            end
        end | xargs ls -d
        cat ~/.projexp.pins
    end | not-fuzf \
        --header "Select a project to open a tmux session" \
        --bind "enter:execute(tmuxhere {})"
end

