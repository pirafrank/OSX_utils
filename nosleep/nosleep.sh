#!/bin/bash

#############################################################################
# nosleep keeps your mac awake
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
#
#############################################################################

let "MIN=$1 * 60"
echo "The system will stay awake for $1 minutes since now ($(date))."
echo "Do NOT close this terminal!" 
echo "You can now turn off the display."
caffeinate -i -t $MIN
