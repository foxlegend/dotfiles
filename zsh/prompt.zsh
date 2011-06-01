# -*- Mode: SH -*-
# File: prompt.zsh (sourced by $HOME/.zshrc)
#
# Author:  David Pequegnot
# Contact: david.pequegnot@gmail.com
#
# Define the prompt displayed by zsh.

######################################################################
# COLORS
####################
# Load colors, necessary for setting the appropriate colors in the
# prompt
autoload colors && colors
######################################################################

######################################################################
# VCS_INFO
####################
# Shows state of the Versioning Control System
# (e.g. git, subversion, mercurial, bazaar etc.)
# See the 'man zshcontrib' for more information.
autoload -Uz vcs_info
# Configuration
source $HOME/.zsh/vcs_info.zsh
######################################################################

######################################################################
# Functions definition
####################
# Write the prompt first line.
# This method is used instead of the PROMPT variable because there is
# a bug while refreshing the prompt, for instance when resizing the
# terminal. Indeed, the line will be duplicated.
prompt_first_line () {
    print -rP "$PR_SET_CHARSET$PR_SHIFT_IN$PR_ULCORNER$PR_HBAR$PR_SHIFT_OUT(%(!.$PR_BOLD_UL_RED%n$PR_RESET.$PR_BOLD_BLUE%n$PR_RESET)@$PR_GREEN%m$PR_RESET:$PR_YELLOW%y$PR_RESET)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT%1(j.(${PR_BOLD_RED}bg: %j$PR_RESET)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT.)($PR_CYAN%~$PR_RESET)"
}
######################################################################

######################################################################
# PROMPT definition
####################
# This function is called before retrieving the PROMPT variable in
# order to display the prompt.
precmd () {
    vcs_info
}

# Main prompt.
PROMPT='%(!.%B%U%F{red}%n%f%u%b.%F{blue}%n%f)@%F{green}%m%f:%F{yellow}%y%f %1(j.(%B%F{red}bg: %j%f%b) .)(%F{cyan}%~%f)
%(!.%B%F{red}#%f%b.%F{green}%%%f) '

# Right part of the prompt.
# It displays vcs infos.
RPROMPT='%(?..[%B%F{red}RC: %?%f%b] )${vcs_info_msg_0_}'

# Alternate prompt for loop (while and foreach) and new lines .
PROMPT2='{%_} '

# The string with which to prompt when confirming automatic spelling 
# correction.
PROMPT3='{ .. } '