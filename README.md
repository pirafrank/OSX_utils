# OSX utils

## Why

#### About the project

As a developer and Mac user I have some needs to speed up my workflow. That's why a coded these utilities. And because *sharing is caring* I've put them on a repo.

You don't need to be a developer to find some of them useful, although you may be if you're reading this!

To those who code, I hope you find here something you like as much as I do.

#### About the alfred workflows

I use a lot editors, keyboard and terminal. Alfred is a great tool that lets you achive some tasks without stop typing.

But I found some tasks to be missing on Alfred so I decided to write the plugins on my own. I hope to help you burst your productivity away from the mouse.

## Requirements

#### free4mac

It should work with OS X 10.8+. Tested on Yosemite.

#### macsleep

It should work with OS X 10.8+. Tested on Yosemite. It may work on Lion.

#### nosleep (CLI)

It should work on OS X 10.6 and above. Tested on Mavericks and Yosemite.

#### userbackup

It teorically works with every OS X version. Tested on Mavericks and Yosemite.

#### Alfred workflows

Please note these are just plugins. You'll need Alfred 2.2+ and its Powerpack.
You can get both [here](http://www.alfredapp.com).

Unfortunately, Alfred only runs on OS X (Snow Leopard and above). I wish there'd be something like it on Linux.

#### OS X Services

They should work with OS X 10.8+. Tested on Mavericks and Yosemite. Some of them may work with Lion.

## Installation

#### nosleep (CLI)

Step 1: `sudo cp nosleep.sh /usr/local/bin/nosleep`

Step 2: `sudo chmod +x /usr/local/bin/nosleep`

#### ... generally

Step 1: sudo cp *nameofthescript.sh* /usr/local/bin/*nameofthescript*

Step 2: sudo chmod +x /usr/local/bin/*nameofthescript*

**Only if there is a .plist file:**

Step 3: cp *nameoftheplistfile.plist* ~/Library/LaunchAgents/

Step 4: launchctl load ~/Library/LaunchAgents/*nameoftheplistfile.plist*

#### Aliases

Paste the content of your alias file of choice to the bottom of ~/.bash_profile.

#### Alfred workflows

Clone the repo or download the .zip. Then double clic to install the workflow you 
want.

## License
The software in this repository is released under the GNU GPLv3 License by Francesco Pira (dev[at]fpira[dot]com, fpira.com). You can read the terms of the license [here](http://www.gnu.org/licenses/gpl-3.0.html).

## Documentation

Coming soon!