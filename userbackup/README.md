# userbackup

Backup user configuration in home dir by copying files in a temporary dir and then tar.gzipping them. Check the script itself for further info.

Note: This is branch 1.x of the script. Since it has been substantially changed and improved, it's now available as a stand-alone project [here](http://github.com/pirafrank/todabu).

#### requirements

It teorically works with every OS X version. Tested on Mavericks and Yosemite.

#### installation

1. sudo cp userbackup.sh /usr/local/bin/userbackup.sh

2. sudo chmod +x /usr/local/bin/userbackup.sh

3. cp org.netsons.fpira.userbackup.plist ~/Library/LaunchAgents/

4. launchctl load ~/Library/LaunchAgents/org.netsons.fpira.userbackup.plist
