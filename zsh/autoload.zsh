# -*- Mode: SH -*-
# File: autoload.zsh
#
# Author:  David Pequegnot
# Contact: david.pequegnot@gmail.com
#
# This files contains modules to load in this zsh configuration.
# The configuration come from the Guillaume Bouffard's one
# @ https://github.com/Stroumph

autoload -Uz compinit
compinit
source $HOME/.zsh/completion.zsh

# Quick ../../..
rationalise-dot() {
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

# Makes available one builtin command and one parameter
autoload zsh/sched

# Copys word from earlier in the current command line
# or previous line if it was chosen with ^[. etc
autoload copy-earlier-word
zle -N copy-earlier-word
bindkey '^[,' copy-earlier-word

# Cycle between positions for ambigous completions
autoload cycle-completion-positions
zle -N cycle-completion-positions
bindkey '^[z' cycle-completion-positions

# Increment integer argument
autoload incarg
zle -N incarg
bindkey '^X+' incarg

# Write globbed files into command line
autoload insert-files
zle -N insert-files
bindkey '^Xf' insert-files

# Play tetris
autoload -U tetris
zle -N tetris
bindkey '^X^T' tetris

# xargs but zargs
autoload -U zargs

# Calculator
autoload zcalc

# Line editor
autoload zed
