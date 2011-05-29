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
# Defines a set of variables to create the prompt.
####################
##
# Found at http://git.sysphere.org/dotfiles/tree/zshrc
# PR_LRCORNER and PR_URCORNER are never used in this zsh
# configuration.
typeset -A altchar 
set     -A altchar ${(s..)terminfo[acsc]}
PR_SET_CHARSET="%{${terminfo[enacs]}%}" # Enables alternate character set (terminfo)
PR_SHIFT_IN="%{${terminfo[smacs]}%}"    # Start alternate character set (terminfo)
PR_SHIFT_OUT="%{${terminfo[rmacs]}%}"   # End alternate character set (terminfo)
PR_HBAR="${altchar[q]:--}"              # Character: a simple horizontal bar
PR_ULCORNER="${altchar[l]:--}"          # Character: an upper-left corner
PR_LLCORNER="${altchar[m]:--}"          # Character: a lower-left corner
# PR_LRCORNER="${altchar[j]:--}"          # Character: a lower-right corner
# PR_URCORNER="${altchar[k]:--}"          # Character: an upper-right corner

for COLOR in RED GREEN BLUE MAGENTA CYAN YELLOW; do
    eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'
    eval PR_BOLD_$COLOR='%B%F{${(L)COLOR}}'
    eval PR_BOLD_UL_$COLOR='%B%U%F{${(L)COLOR}}'
    eval PR_UL_$COLOR='%U%F{${(L)COLOR}}'
done

PR_RESET="%{$reset_color%}"
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
    prompt_first_line
}

# Main prompt.
PROMPT='$PR_SHIFT_IN$PR_LLCORNER$PR_HBAR$PR_SHIFT_OUT(%(?..$PR_BOLD_MAGENTA%?$PR_RESET:)%(!.$PR_BOLD_RED#$PR_RESET.$PR_GREEN%%$PR_RESET)) '

# Right part of the prompt.
# It displays vcs infos.
RPROMPT='${vcs_info_msg_0_}'

# Alternate prompt for loop (while and foreach) and new lines .
PROMPT2='{%_} '

# The string with which to prompt when confirming automatic spelling 
# correction.
PROMPT3='{ .. } '