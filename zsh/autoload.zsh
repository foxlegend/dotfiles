# -*- Mode: SH -*-
# File: autoload.zsh
#
# Author:  David Pequegnot
# Contact: david.pequegnot@gmail.com
#
# This files contains modules to load in this zsh configuration.

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

#
autoload -U colors && colors	# Enables colors