# My .zshrc file
#
# Written by Matthew Blissett.
#
# Latest version available from <http://matt.blissett.me.uk/linux/zsh/zshrc>
#
# Some functions taken from various web sites/mailing lists, others written
# myself.
#
# Last updated 2010-07-17
#
# Released into the public domain.
#

# Skip all this for non-interactive shells
#[[ -z "$PS1" ]] && return

source $HOME/.zsh/autoload.zsh
source $HOME/.zsh/options.zsh
source $HOME/.zsh/global_variables.zsh
source $HOME/.zsh/prompt.zsh