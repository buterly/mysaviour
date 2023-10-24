# copy the active line from he command line buffer 
# onto the system clipboard

copybuffer () {
    printf "%s" "$BUFFER" | xclip -selection clipboard
}
zle -N copybuffer

bindkey -M emacs "^O" copybuffer
bindkey -M viins "^O" copybuffer
bindkey -M vicmd "^O" copybuffer
