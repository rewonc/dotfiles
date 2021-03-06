#!/usr/bin/env bash

# First, set up bash to use a new bash
# Add the new shell to the list of allowed shells
# sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell
# chsh -s /usr/local/bin/bash 

# cd "$(dirname "${BASH_SOURCE}")";

# git pull origin master;

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "sublime.sh" --exclude "brew.sh" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
