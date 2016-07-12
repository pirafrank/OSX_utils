# nosleep

Prevent your Mac from sleeping for given minutes. Useful to use by hand or in a script.

This dummy script relies on caffeinate.

Example: `nosleep 30` will make your Mac stay awake for 30 mins. You can also turn the display off after setting this (hot corners are your friends!).

#### requirements

It should work on OS X 10.6 and above. Tested on Mavericks and Yosemite.

#### installation

1. `sudo cp nosleep.sh /usr/local/bin/nosleep`

2. `sudo chmod +x /usr/local/bin/nosleep`
