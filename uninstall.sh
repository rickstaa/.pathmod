#!/bin/bash

# Remove .pathmod_rc initiation from .bashrc
start_str="# >>> pathmod initialize >>>"
end_str="# <<< pathmod initialize <<<"
exists=$(sed -n "/$start_str/,/$end_str/p" ~/.bashrc) # Check if patern is already present

# REmove symbolic link to the .pathmod_rcfile
WRAPPER_NAME="pathmod_rc"
WRAPPER_LINK="$(echo $HOME)/$WRAPPER_NAME"
if [ -L ${WRAPPER_LINK} ]; then
    if [ -e ${WRAPPER_LINK} ]; then
        echo "Pathmod script file removed from you home directory."
        rm $WRAPPER_LINK
    else
        echo "Pathmod script file not present in you home directory."
    fi
elif [ -e ${WRAPPER_LINK} ]; then
    echo "Pathmod script file removed from you home directory."
    rm $WRAPPER_LINK
else
    echo "Pathmod script file not present in you home directory."
fi

# Remove .pathmod_rc source line from the .bashrc file if it exists
if [ -z "$exists" ]; then
    echo "Pathmod script not yet installed on your .bashrc file."
else
    sed --follow-symlinks -e "/$start_str/,/$end_str/d" -i.bak ~/.bashrc
    sed --follow-symlinks -e '${/^$/d;}' -i ~/.bashrc # Remove empty line if present
    echo "Pathmod script succesfully removed from your .bashrc file."
fi
