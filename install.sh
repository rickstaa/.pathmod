#!/bin/bash

# Check if wrapper does already exists
start_str="# >>> pathmod initialize >>>"
end_str="# <<< pathmod initialize <<<"
exists=$(sed -n "/$start_str/,/$end_str/p" ~/.bashrc) # Check if patern is already present

# Create symbolic link to the .pathmod_rc file
WRAPPER_NAME="pathmod_rc"
WRAPPER_LINK="$(echo "$HOME")/$WRAPPER_NAME"
if [ -L "${WRAPPER_LINK}" ]; then
    if [ -e "${WRAPPER_LINK}" ]; then
        echo "Pathmod script already present in your home directory."
    else
        echo "Pathmod script added to your home directory."
        ln -fs "$(pwd)/$WRAPPER_NAME" "$(echo "$HOME")/.$WRAPPER_NAME"
    fi
elif [ -e "${WRAPPER_LINK}" ]; then
    echo "Pathmod script added to your home directory."
    ln -fs "$(pwd)/$WRAPPER_NAME" "$(echo "$HOME")/.$WRAPPER_NAME"
else
    echo "Pathmod script added to your home directory."
    ln -fs "$(pwd)/$WRAPPER_NAME" "$(echo "$HOME")/.$WRAPPER_NAME"
fi

# Append .pathmod_rc script source command to the .bashrc if it does not exist yet
if [ -z "$exists" ]; then
    cp ~/.bashrc ~/.bashrc_bak # Create backup
    sed --follow-symlinks -e '${/^$/!G;}' -i ~/.bashrc
    cat >>~/.bashrc <<-EOL
$start_str
## Source pathmod script
if [ -f "$HOME/.pathmod_rc" ]; then
    . "$HOME/.pathmod_rc"
fi
$end_str
EOL
    echo "Pathmod alias installed to your .bashrc file."
else
    echo "Pathmod alias already installed to your .bashrc file."
fi
