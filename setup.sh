#!/bin/bash

DOTFILES_DIRECTORY="${HOME}/.dotfiles"

# Ask for confirmation before proceeding
seek_confirmation() {
	printf "\n"
	printf "$(tput setaf 136)! %s$(tput sgr0)\n" "$@"
	read -p "Continue? (y/n) " -n 1
	printf "\n"
}

# Test whether the result of an 'ask' is a confirmation
is_confirmed() {
	if [[ "$REPLY" =~ ^[Yy]$ ]]; then
		return 0
	fi
	return 1
}

link() {
	# Force create/replace the symlink.
	ln -fs "${DOTFILES_DIRECTORY}/${1}" "${HOME}/${2}"
}

mirrorfiles() {
	# Create the necessary symbolic links between the `.dotfiles` and `HOME`
	# directory. The `bash_profile` sources other files directly from the
	# `.dotfiles` repository.
	link "shell/bashrc"       ".bashrc"
	link "shell/bash_profile" ".bash_profile"
}

# Ask before potentially overwriting files
seek_confirmation "Warning: This step may overwrite your existing dotfiles."

if is_confirmed; then
	mirrorfiles
	source ${HOME}/.bash_profile
else
	printf "Aborting...\n"
	exit 1
fi
