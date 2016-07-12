# OSX utils

As a developer and Mac user I have some needs to speed up my workflow. That's why a coded these utilities. And because *sharing is caring* I've put them on a repo.

You don't need to be a developer to find some of them useful, although you may be if you're reading this!

To those who code, I hope you find here something you like as much as I do.

## Requirements and instructions

Please check the README inside your script of choice. Usually only macOS is needed.

#### OS X Services

They should work with OS X 10.8+. Tested on Mavericks and Yosemite. Some of them may work with Lion.

## Installation

#### Scripts

1. sudo cp *nameofthescript.sh* /usr/local/bin/*nameofthescript*

2. sudo chmod +x /usr/local/bin/*nameofthescript*

**Only if there is a .plist file:**

3. cp *nameoftheplistfile.plist* ~/Library/LaunchAgents/

4. launchctl load ~/Library/LaunchAgents/*nameoftheplistfile.plist*

#### Aliases

Paste the content of your alias file of choice to the bottom of your `~/.bash_profile`.

#### Services

Unzip it and copy it to `~/Library/Services`.

#### iTerm and Terminal themes

Just double click them.

## License

The software in this repository is released under the GNU GPLv3 License by Francesco Pira (dev[at]fpira[dot]com, fpira.com). You can read the terms of the license [here](http://www.gnu.org/licenses/gpl-3.0.html).
