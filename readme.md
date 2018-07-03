# repave scripts 

This repo contains some scripts and registry files I use whenever I repave any of my PCs. Theses scripts help me in getting my system ready for use fast and consistent.

## contributing

The scripts here were created for my personal use and according to my personal needs, workflows and preferences. 

I **will** accept pull requests with improvements to the processes, tools and apis used and maybe even suggestions of new apps and tools if I find them usefull.

I **will not** accept pull requests to add tools or features I do not need, like or otherwise have no intention of using.

That being said, feel free to clone or fork this repo and change it to suit your needs.

## running the scripts

These scripts should work if executed in any order and are independent of each other.

- [install.bat]() - installs my main apps from Chocolatey, Windows Store and web links and also remove provisions and uninstalls unwanted apps.
- [reg-notepad.reg]() - registers notepad as a possible editor for ANY file type on right click.
- [reg-unblock.reg]() - adds a command to the mouse right that allows to unlock multiple files or folders at once (usefull for downloaded stuff).

## license

This project is licensed under the MIT License - see the [LICENSE.md]() file for details

## some history and acknowledgments

The inicial version of theses scripts were created by me circa 2014 and stored in a folder at my personal OneDrive. I started with the registry files and later began using a .bat file to install apps from Chocolatey.org.

Recently, inspired by [https://github.com/Microsoft/windows-dev-box-setup-scripts](), I started improving my script to try and add Windows Store apps and remove some junk/unwanted apps that come on new installs of Windows 10.

After a LOT or research I realized that that are no automation apis for the Windows Store (not yet anyway), so I opened an issue asking to [Make is possible to install apps from the Store](https://github.com/Microsoft/windows-dev-box-setup-scripts/issues/30) and decided to start versioning my scripts here, so I can properly keep track of the changes I make.

I would like to thank [Yosef Durr](https://github.com/yodurr), [DarthSpock](https://github.com/DarthSpock), [Gary Ewan Park](https://github.com/gep13), [Rick Turner](https://github.com/bitcrazed) for all the feedback and information they provided in the issue I created. They are the reason I decided to make this a public repo, so others can benefit too from what I learn.

I also created a new feedback suggetion for Windows: [Provide a way (scripting api/commands) for users to install/remove Store apps via command-line scripts](https://aka.ms/AA1bl1g). Any upvotes and comments will be greatly appreciated.
