# -*- Mode: SH -*-
# File: vcs_info.zsh
#
# Author:  David Pequegnot
# Contact: david.pequegnot@gmail.com
#
# VCS_INFO
# Shows state of the Versioning Control System
# (e.g. git, subversion, mercurial, bazaar etc.)
# See the 'man zshcontrib' for more information.

######################################################################
# Configuration
####################
# vcs_info goes the extra mile to figure out the revision of a 
# repository’s work tree.
zstyle ':vcs_info:(hg*|git*):*' get-revision true
# This style causes the %c and %u format escapes to show when the
# working directory has uncommited changed. The strings displayed
# by these escapes can be controlled via the stagedstr and
# unstagedstr styles.
zstyle ':vcs_info:(hg*|git*):*' check-for-changes true

# Displays VCS informations (vcs_info_msg_0_)
zstyle ':vcs_info:*' formats "[%F{green}%s%f] [%F{yellow}%b%f] %c %u"
zstyle ':vcs_info:*' actionformats "[%F{green}%s%f|%B%F{red}%a%f%b] [%F{yellow}%b%f] %c %u"