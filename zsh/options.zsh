# -*- Mode: SH -*-
# File: options.zsh
#
# Author:  David Pequegnot
# Contact: david.pequegnot@gmail.com
#
# This file contains all options needed in this zsh configuration.
# The configuration comes from the Guillaume Bouffard's one:
# @ https://github.com/Stroumph but in an emacs profile.

# Enable to use variables in the prompt definition 
# (needed by the vcs_info module, i.e. ${vcs_info_msg_N_})
setopt prompt_subst

setopt AUTOLIST

# Say how long a command took, if it took more than 30 seconds
export REPORTTIME=30

# Zsh spelling correction options
setopt correctall
#setopt DVORAK

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT

# Background processes aren't killed on exit of shell
setopt AUTO_CONTINUE

# Don’t write over existing files with >, use >! instead
setopt NOCLOBBER

# Don’t nice background processes
setopt NO_BG_NICE

# Watch other user login/out
watch=notme
export LOGCHECK=60

# Zsh settings for history
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=5000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Set less options
if [[ -x $(which less) ]]
then
    export PAGER="less"
    export LESS="--ignore-case --LONG-PROMPT --QUIET --chop-long-lines -Sm --RAW-CONTROL-CHARS --quit-if-one-screen --no-init"
fi

# Set default editor
if [[ -x $(which vim) ]]
then
    export EDITOR="vim"
    export USE_EDITOR=$EDITOR
    export VISUAL=$EDITOR
fi

# Enable color support of ls
if [[ "$TERM" != "dumb" ]]; then
    if [[ -x `which dircolors` ]]; then
	eval `dircolors -b`
	alias 'ls=ls --color=auto'
    fi
fi

# PDF viewer (just type 'file.pdf')
if [[ -x `which zathura` ]]; then
    alias -s 'pdf=zathura'
else
        if [[ -x `which evince` ]]; then
                alias -s 'pdf=evince'
        fi
fi

#Disable core dumps
limit coredumpsize 0 
