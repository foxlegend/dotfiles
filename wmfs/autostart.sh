#!/bin/sh
# WMFS configuration (autostart.sh)
#
# Maintener: David Pequegnot <david.pequegnot@gmail.com> aka `FoxLegend'
# Github   : https://github.com/foxlegend/dotfiles
# Bitbucket: https://bitbucket.org/FoxLegend/dotfiles
#
# Autostart script

# It will just launch the status.sh script, until
# WMFS is not modified to manager status.sh itself.

exec $HOME/.config/wmfs/status.sh