#!/bin/bash

#############################################################################
# nosleep <https://github.com/pirafrank/OSX_utils/>
# Easy way to keep your mac awake
#
# Copyright (C) 2015 Francesco Pira <dev@fpira.com>
#
# This file is part of OSX_utils
#
# OSX_utils is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# OSX_utils is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with OSX_utils. If not, see <http://www.gnu.org/licenses/>.
#
################################################################################

if [[ $# != 1 ]]; then
    echo "nosleep - Prevent your Mac from sleeping"
    echo "Usage: nosleep [minutes]"
    echo ""
    exit 1
fi

let "MIN=$1 * 60"
echo "The system will stay awake for $1 minutes since now ($(date))."
echo "Do NOT close this terminal!" 
echo "You can now turn off the display."
caffeinate -i -t $MIN
