# -*- Mode: SH -*-
# File: alias.zsh (sourced by .zshrc)
#
# Author:  David Pequegnot
# Contact: david.pequegnot@gmail.com
#
# Command aliases.

# cd
alias 'cd= cd'
alias 'cd..=cd ..'

# cp
alias 'cp=cp -i'

# du
alias 'dus=du -ms * | sort -n'

# grep
alias 'grep=grep --colour'

# jobs
alias 'j=jobs -l'

# ls
alias 'ls=ls --color=auto'
alias 'l=ls'
alias 'll=ls -l'
alias 'la=ls -la'
alias 'lq=ls -Q'
alias 'lr=ls -R'
alias 'lrs=ls -lrS'
alias 'lrt=ls -lrt'
alias 'lrta=ls -lrtA'

# mkdir
alias 'mkdir=mkdir -p'

# mv
alias 'mv=mv -i'

# rm
alias 'rm=rm -i'

# tail
alias 'tf=tail -f'

# Global aliases (expand whatever their position)
#  e.g. find . E L
alias -g L='| less'
alias -g H='| head'
alias -g S='| sort'
alias -g T='| tail'
alias -g N='> /dev/null'
alias -g E='2> /dev/null'