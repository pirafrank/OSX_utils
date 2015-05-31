#!/bin/bash

################################################################################
# UserBackup <https://github.com/pirafrank/OSX_utils/>
# Backup user configuration files and info
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

# NOTES
#
# Please set BACKUP_PATH to a subfolder in your Dropbox, Google Drive, etc. folder
# to feature cloud sync. 
#
# Be aware that if you do not want some files to sync (e.g. you're 
# worried about privacy of ssh folder and keys) you can comment those ones out 
# in the proper section.


###################################################################################
# User's settings

COMPUTER_NAME="rMBP"
BACKUP_PATH="${HOME}/Documents/user_backups"
# Number of backups to keep
N_HOURLY="0"
N_DAILY="7"
N_WEEKLY="4"
N_MONTHLY="6"
N_YEARLY="2"

###################################################################################
# Script header - Do NOT touch this!

TMP_PATH="${HOME}/.tmp_ub"
DATE=$(date +%Y-%m-%d_%H.%M)

if [[ ! -d $TMP_PATH ]]; then
     mkdir -p -m 700 $TMP_PATH
fi

if [[ ! -d $BACKUP_PATH ]]; then
     mkdir -p $BACKUP_PATH
fi

cd ${TMP_PATH}
mkdir "${COMPUTER_NAME}_{DATE}"
cd "${COMPUTER_NAME}_{DATE}"

###################################################################################
# Backup section - comment out only what you don't need!

# save app list
date | ls -l /Applications/ > installed_apps.txt

# save user-installed software
date | ls -l /usr/local/bin/ > installed_usr_local_bin.txt

# save installed port list
date | port installed > installed_ports.txt

# save installed pip package list
date | pip list > pip_installed.txt

# save list of globally installed npm packages
date | npm list -g --depth=0 > npm_installed.txt

# save installed gems list
date | gem list > gem_installed.txt

# backing up user configuration files
cp ${HOME}/.bash_profile ./bash_profile
cp ${HOME}/.bashrc ./bashrc
cp ${HOME}/.profile ./profile

# ssh keys and configuration backup
mkdir ./ssh
cp ${HOME}/.ssh/config ./ssh/config
cp ${HOME}/.ssh/known_hosts ./ssh/known_hosts

# backing up git configuration files
cp ${HOME}/.gitconfig ./gitconfig
cp ${HOME}/.gitignore_global ./gitignore_global

# backing up /etc/hosts
cp /etc/hosts ./hosts

# backing up sublime text 3 stuff
cp -rf "${HOME}/Library/Application Support/Sublime Text 3/Packages/" ./sublime-text-packages
cp -rf "${HOME}/Library/Application Support/Sublime Text 3/Installed Packages/" ./sublime-text-installed-packages

# list of installed quicklook plugins
date | ls -l ${HOME}/Library/QuickLook > user_installed_quicklook_plugins.txt

# list of installed fonts
date | ls -l ${HOME}/Library/fonts > user_installed_fonts.txt

# list of installed screen savers
date | ls -l "${HOME}/Library/Screen Savers" > user_installed_screensavers.txt

###################################################################################
# Script footer - Do NOT touch this!

mkdir "${BACKUP_PATH}/${DATE}"
cd ${TMP_PATH}
tar -zcf "${COMPUTER_NAME}_${DATE}.tar.gz" "${COMPUTER_NAME}_{DATE}"
mv "${COMPUTER_NAME}_${DATE}.tar.gz" "${BACKUP_PATH}/${DATE}/"

# cleaning up...
sleep 1
cd ${BACKUP_PATH}
rotate-backups --hourly=${N_HOURLY} --daily=${N_DAILY} --weekly=${N_WEEKLY} --monthly=${N_MONTHLY} --yearly=${N_YEARLY} . > /dev/null 2>&1
rm -rf ${TMP_PATH}

# notify backup complete
/usr/bin/osascript -e 'display notification "Backup completed." with title "User Backup script"'




