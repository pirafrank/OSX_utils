#!/bin/bash

################################################################################
# UserBackup
# backup user configuration files and info
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
#
# developer's website: fpira.com
#
################################################################################

# NOTES
# Please symlink the .user_backups folder to your Dropbox, Google Drive, etc. folder
# to feature cloud sync. 

# Be aware that if you do not want some files to sync (e.g. you're 
# worried about privacy of ssh folder and keys) you can comment those ones out 
# in the proper section.

# INSTALLATION
# cd to the script folder
# sudo cp userbackup.sh /usr/local/bin/userbackup

# USAGE
# $ userbackup

# UNINSTALL
# sudo rm /usr/local/bin/userbackup


# variables
USER_PATH="/Users/$(whoami)"
BACKUP_PATH="/Users/$(whoami)/Documents/user_backups"
DATE=$(date +%Y-%m-%d_%H.%M)

# checking if folder exists otherwise it and its ancestors are created
if [[ ! -d $BACKUP_PATH ]]; then
     mkdir -p $BACKUP_PATH
fi

cd $BACKUP_PATH
mkdir $DATE
cd $DATE

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
cp $USER_PATH/.bash_profile ./bash_profile
cp $USER_PATH/.bashrc ./bashrc
cp $USER_PATH/.profile ./profile

# ssh keys and configuration backup
mkdir ./ssh
cp -rf $USER_PATH/.ssh/ ./ssh

# backing up git configuration files
cp $USER_PATH/.gitconfig ./gitconfig
cp $USER_PATH/.gitignore_global ./gitignore_global

# backing up /etc/hosts
cp /etc/hosts ./hosts

# backing up sublime text 3 stuff
cp -rf "/Users/$(whoami)/Library/Application Support/Sublime Text 3/Packages/" ./sublime-text-packages
cp -rf "/Users/$(whoami)/Library/Application Support/Sublime Text 3/Installed Packages/" ./sublime-text-installed-packages

# list of installed quicklook plugins
date | ls -l $USER_PATH/Library/QuickLook > user_installed_quicklook_plugins.txt

# list of installed fonts
date | ls -l $USER_PATH/Library/fonts > user_installed_fonts.txt

# list of installed screen savers
date | ls -l "$USER_PATH/Library/Screen Savers" > user_installed_screensavers.txt

# keeping the backup folder clean...
cd $BACKUP_PATH
rotate-backups --hourly=0 --daily=7 --weekly=4 --monthly=6 --yearly=2 . > /dev/null 2>&1

# notify backup complete
/usr/bin/osascript -e 'display notification "Backup completed." with title "User Backup script"'









