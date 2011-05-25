# -*- Mode: SH -*-
# File: global_variables.zsh
#
# Author:  David Pequegnot
# Contact: david.pequegnot@gmail.com
#
# Defines global variables needed by the zsh configuration.

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
######################################################################