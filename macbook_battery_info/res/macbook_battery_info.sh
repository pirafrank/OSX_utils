#!/bin/bash


##### Macbook battery info script #####
# Easily check your macbook battery percentage, if it's charging and remaining time.
# Tested on Mavericks.
# Be sure the script has execution permission.

# @Author
# Francesco Pira
# pirafrank.netsons.org

# TIPS
# Works best if script is triggered by hotkey or hotword in Alfred app.



# ALERT VERSION (believe me, it's ugly)
#BATT_STATUS=$( pmset -g batt | egrep "([0-9]+\%).*" -o | tr ";" "," )
#osascript -e 'display alert "'"Battery Status: $BATT_STATUS"'"'

# CURRENT VERSION
# BATT_STATUS=$( pmset -g batt | egrep "([0-9]+\%).*" -o | tr ";" "," )
#osascript -e 'display dialog "'"Battery Status: $BATT_STATUS"'" buttons {"Close"} default button "Close"'
osascript -e 'display dialog "'"Battery Status: $( pmset -g batt | egrep "([0-9]+\%).*" -o | tr ";" "," )"'" buttons {"Close"} default button "Close"'


# DEVELOPMENT (improving the result...)
#STRI=$( echo "75%; charging; 1:12 remaining" | tr ";" "," )
#osascript -e 'display dialog "'"Battery Status: $STRI"'" with icon path to resource "'"/Users/francesco/Downloads/battery.icns"'"'
#osascript -e 'display dialog "'"Battery Status: $STRI"'" with icon file "/Users/francesco/Downloads/battery.icns"'
#osascript -e 'display dialog "'"Battery Status: $STRI"'" buttons {"Close"} default button "Close"'
