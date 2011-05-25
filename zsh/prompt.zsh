# -*- Mode: SH -*-
# File: prompt.zsh (sourced by $HOME/.zshrc)
#
# Author:  David Pequegnot
# Contact: david.pequegnot@gmail.com
#
# Define the prompt displayed by zsh.

# Write the first line of the prompt.
# This method is used instead of the PROMPT variable because there is
# a bug with 
prompt_first_line () {
    print -rP "$PR_SET_CHARSET$PR_SHIFT_IN$PR_ULCORNER$PR_HBAR$PR_SHIFT_OUT(%(!.%B%U%F{red}%n%f%u%b.%F{green}%n%f)@%F{magenta}%m%f:%F{yellow}%y%f)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(%F{cyan}%~%f)"
}

precmd () {
    vcs_info
    prompt_first_line
}

PROMPT='$PR_SHIFT_IN$PR_LLCORNER$PR_HBAR$PR_SHIFT_OUT(%(?..%B%F{red}%?%f%b:)%(!.%F{red}#%f.%F{green}%%%f)) '

RPROMPT='${vcs_info_msg_0_}'

PROMPT2='{%_} '

PROMPT3='{ .. } '