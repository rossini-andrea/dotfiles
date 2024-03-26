function tmuxhere_start -d "Runs inside tmux, setting the environment"
    set -l pwdmd5 (string sub -l 32 (echo $PWD | md5sum))
    set -lx NVIM_SERVER_PIPE /tmp/.nvimt.$pwdmd5.sock
    tmux setenv NVIM_SERVER_PIPE $NVIM_SERVER_PIPE 
    nvimpane .
    exec fish
end
