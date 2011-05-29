# -*- Mode: SH -*-
# File: export.zsh (sourced by .zshrc)
#
# Author:  David Pequegnot
# Contact: david.pequegnot@gmail.com
#
# This file contains all variables to export.

# Enables cope, a wrapper to color the terminal.
# https://github.com/cytzol/cope
export PATH=$(/usr/share/perl5/vendor_perl/cope_path.pl):$PATH

# Default EDITOR
export EDITOR=emacs

# Default PAGER
export PAGER=most

# Default EDITOR for MOST
export MOST_PAGER="emacs"