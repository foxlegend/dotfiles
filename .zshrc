# -*- Mode: SH -*-
# File: .zshrc
#
# Author:  David Pequegnot
# Contact: david.pequegnot@gmail.com
#
# My zsh configuration file.
# Some elements come from other zsh configurations.

# Skip all this for non-interactive shells
[[ -z "$PS1" ]] && return

source $HOME/.zsh/export.zsh
source $HOME/.zsh/autoload.zsh
source $HOME/.zsh/options.zsh
source $HOME/.zsh/global_variables.zsh
source $HOME/.zsh/prompt.zsh
source $HOME/.zsh/alias.zsh