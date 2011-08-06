#!/bin/sh
# WMFS configuration (status.sh)
#
# Maintener: David Pequegnot <david.pequegnot@gmail.com> aka `FoxLegend'
# Github   : https://github.com/foxlegend/dotfiles
# Bitbucket: https://bitbucket.org/FoxLegend/dotfiles
#
# Based on bacardi55's configuration: https://github.com/bacardi55/dotfiles
#
# Status shell script

# /!\ For now (git mainstream), the status.sh script must be launched by
#     the user. Please read the wmfs wiki carefully to use status.sh
#     scripts.
# /!\
# Most of this status.sh script was written by bacardi55.

# Color definition
WHITE="\\#C0C0C0\\"
GREEN="\\#5AAB25\\"
RED="\\#FF6B6B\\"
ORANGE="\\#FFCC33\\"

_network() {
	############
	#	network
	#
	# network usage stats
	#
	# Variables
	ethiface=eth0
	wlaniface=wlan0
	tmpdir=/tmp
	#
	# Functions
	function rx_bytes { # download
		rxethernet=`cat /sys/class/net/$ethiface/statistics/rx_bytes`
		rxwireless=`cat /sys/class/net/$wlaniface/statistics/rx_bytes`
		echo $(($rxethernet+$rxwireless))
	}
	#
	function tx_bytes { # upload
		txethernet=`cat /sys/class/net/$ethiface/statistics/tx_bytes`
		txwireless=`cat /sys/class/net/$wlaniface/statistics/tx_bytes`
		echo $(($txethernet+$txwireless))
	}
	#
	# Download
	lastrxbytes=`cat $tmpdir/last_rxbytes`
	# Upload
	lasttxbytes=`cat $tmpdir/last_txbytes`
	#
	# Download
	rxbytes=`rx_bytes`
	rxresult=$((($rxbytes-lastrxbytes)/1000))
	echo $rxbytes > $tmpdir/last_rxbytes
	#
	# Upload
	txbytes=`tx_bytes`
	txresult=$((($txbytes-lasttxbytes)/1000))
	echo $txbytes > $tmpdir/last_txbytes
	#
	# Output
	network="$WHITE[ ↓ $GREEN$rxresult$WHITE  Ko/s | $GREEN$txresult$WHITE Ko/s ↑ ]$WHITE"
	#
	############
}

_battery() {
    ############
    # battery state
    #
    bat_percent=$((`cat /sys/class/power_supply/BAT*/charge_now`/`cat /sys/class/power_supply/BAT*/charge_full | sed 's/00$//'`))
    bat_acpi=`cat /sys/class/power_supply/BAT*/status`
    bat_ac="AC"

    if [ "$bat_acpi" = "Discharging" ]; then
	bat_state="↓"
	bat_ac="Bat."
    elif [ "$bat_acpi" = "Charging" ]; then
        bat_state="↑"
    fi

    if [ "$bat_percent" -gt "100" ]; then
	bat_percent="100"
    fi

    if [ "$bat_percent" -lt "15" ]; then
	if [ "$bat_percent" -lt "10" ]; then
	    if [ "`cat /tmp/battery_low`" -eq "0" ]; then
		color=$RED
		echo 1 > /tmp/battery_low
	    else
		color=$GREEN
		echo 0 > /tmp/battery_low
	    fi
	else
	    color=$ORANGE
	fi
    else
	color=$GREEN
    fi
    
    battery="[ $bat_ac $color$bat_state$bat_percent%$WHITE ]$WHITE"
    
}

_memory() {
	############
	# memory usage
	#
	memory_used="`free -m | grep Mem:| awk '{print $3}'`"
	memory_total="`free -m | grep Mem:| awk '{print $2}'`"
	memory_warning_limit=$(($memory_total*2/3))
        memory_critical_limit=$(($memory_total*3/4))

	if [ "$memory_used" -gt "$memory_warning_limit" ]; then
	    if [ "$memory_used" -gt "$memory_critical_limit" ]; then
		color=$RED
	    else
		color=$ORANGE
	    fi
        else
	    color=$GREEN
        fi

	memory="[ $color$memory_used$WHITE/$memory_total$WHITE Mo ]"
	#
	############
}

_volume() {
	############
	# volume
	#
	# <amixer> is required
	#
	if [ "`amixer get Master | grep '\[off\]$'`" = "" ]; then
		volume="[ Vol. $GREEN`amixer get Master | sed -n 's|.*\[\([0-9]*\)\%.*|\1%|pg'`$WHITE ]"
	else
		volume="[ Vol.$GREEN off$WHITE ]"
	fi
	#
	############
}

_date() {
        ############
        # date and time
        #
        sys_date=`date '+%a %d %b %Y'`
        sys_time=`date '+%H:%M'`
        date="[ $GREEN$sys_date - $sys_time$WHITE ]$WHITE"
}

statustext() {
	############
	# concatenate arguments
	#
        args=""
	for arg in $@; do
		_${arg}
		args="${args}  `eval echo '$'$arg`"
	done
	#
	############
	# wmfs magic
	#
	wmfs -s "$args"
	#
	############
}

############
# status text
#
# add <variables> from the following list
# mpd network battery uptime volume date hour ompload
#
#statustext ompload mpd network battery date hour
while true; do 
    statustext memory battery volume date
    sleep 1
done
#
############