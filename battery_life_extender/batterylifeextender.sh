#!/bin/bash

########################################################################
# BatteryLifeExtender
# Notifies the user when plug or unplug the power cord to extend the overall battery life
#
# Copyright (C) 2015 Francesco Pira <francescopira.me@gmail.com> 
#
# This script is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This script is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this script.  If not, see <http://www.gnu.org/licenses/>.

# developer's website: fpira.com

########################################################################

status="$(pmset -g batt | egrep "([0-9]+\%).*" -o)"
substring1="discharging"
charge="$(cut -d '%' -f 1 <<< "$status")"

if [ "${status/$substring1}" = "$status" ] ; then
  #echo "charging..."
  if (( "$charge" >= 80 )) ; then
     # notify
     thescript='display notification "You can now unplug the power cord to extend the overall battery life." with title "BatteryLifeExtender" subtitle '
     the2part="\"Unplug your mac! Charge is ${charge}%\""
     /usr/bin/osascript -e "${thescript}${the2part}"
  fi
else
  #echo "discharging..."
  if (( "$charge" <= 40 )) ; then
     # notify
     thescript='display notification "You should plug your mac to a power outlet to extend the overall battery life." with title "BatteryLifeExtender" subtitle '
     the2part="\"Plug you mac! Charge is ${charge}%\""
     /usr/bin/osascript -e "${thescript}${the2part}"  
  fi
fi
