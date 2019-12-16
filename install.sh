#!/bin/bash

###########
# INSTALL #
###########

# Add any additional shell config files here to be
# included in the installation process.
CONFIG_FILES=(.bashrc .zshrc)

SETUP_FILES=(.commonrc .bash_aliases)
CWD=$(pwd)

echo && echo "Installing shell settings to existing setup:"
for SETUP_FILE in "${SETUP_FILES[@]}"; do
	if [ -f "$SETUP_FILE" ]; then
		echo "- $SETUP_FILE exists, making backup and replacing."
		mv $HOME/$SETUP_FILE $HOME/$SETUP_FILE.bak
	else 
		echo "- Copying $SETUP_FILE to home directory"
	fi
	cp $SETUP_FILE $HOME/$SETUP_FILE
done


# Add setting file references to config files if not already present
echo
echo "Referencing .commonrc file in existing shell config files:"
for CONFIG_FILE in "${CONFIG_FILES[@]}"; do
	if grep -Fxq "if [ -f $HOME/.commonrc ]; then" $HOME/$CONFIG_FILE
	then
		echo "- .commonrc already referenced from $HOME/$CONFIG_FILE"
	else
		echo "Adding new settings to $HOME/$CONFIG_FILE"
		cat .addthis >> $HOME/$CONFIG_FILE
	fi
done


###########
# CLEANUP #
###########

TEMPFILE=temp.txt

function produce_diff {
        git diff --color $HOME/$SETUP_FILE.bak $HOME/$SETUP_FILE > $TEMPFILE
        echo && echo
	echo "[$SETUP_FILE]"
        echo "<-- START DIFF -->"
        echo
        cat $TEMPFILE
        echo
        echo "<-- END DIFF -->"
        echo && echo
        rm $TEMPFILE
}

function cleanup_file {
        produce_diff
        read -p "Would you like to cleanup $SETUP_FILE.bak file? (y/n): " RESPONSE
        if [ "$RESPONSE" == "y" ]; then
                echo "Removing $SETUP_FILE.bak..."
                rm $HOME/$SETUP_FILE.bak
        fi
}

function run_cleanup {
        echo "Starting cleanup..."
        for SETUP_FILE in "${SETUP_FILES[@]}"; do
                if [ -f "$SETUP_FILE.bak" ]; then
                        cleanup_file
                fi
        done
        echo "Cleanup finished!"
}

echo && echo "========================" && echo
cd && run_cleanup
cd $CWD

