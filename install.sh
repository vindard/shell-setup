#!/bin/bash

###########
# INSTALL #
###########

SETUP_FILES=(.commonrc .bash_aliases)

echo "Installing shell settings to existing setup:"
for SETUP_FILE in "${SETUP_FILES[@]}"; do
	if [ -f "$SETUP_FILE" ]; then
		echo "$SETUP_FILE exists, making backup and copying new file from repo across."
		mv ~/$SETUP_FILE ~/$SETUP_FILE.bak
	else 
		echo "Copying $SETUP_FILE to home directory"
	fi
	cp $SETUP_FILE ~/$SETUP_FILE
done


# Add setting file references to config files if not already present

CONFIG_FILES=(~/.bashrc ~/.zshrc)

echo
echo "Referencing .commonrc file in existing shell config files:"
for CONFIG_FILE in "${CONFIG_FILES[@]}"; do
	if grep -Fxq "if [ -f ~/.commonrc ]; then" $CONFIG_FILE
	then
		echo "- .commonrc already referenced from $CONFIG_FILE"
	else
		echo "Adding new settings to $CONFIG_FILE"
		cat .addthis >> $CONFIG_FILE
	fi
done


###########
# CLEANUP #
###########

CWD=$(pwd)
TEMPFILE=temp.txt

SETUP_FILES=(.commonrc .bash_aliases)

function produce_diff {
        git diff --color ~/$SETUP_FILE.bak ~/$SETUP_FILE > $TEMPFILE
        echo
        echo
        echo "<-- START DIFF -->"
        echo
        cat $TEMPFILE
        echo
        echo "<-- END DIFF -->"
        echo
        echo
        rm $TEMPFILE
}

function cleanup_file {
        produce_diff
        read -p "Would you like to cleanup $SETUP_FILE.bak file? (y/n): " RESPONSE
        if [ "$RESPONSE" == "y" ]; then
                echo "Removing $SETUP_FILE.bak..."
                rm ~/$SETUP_FILE.bak
        fi
}

function run {
        echo "Starting cleanup..."
        echo
        for SETUP_FILE in "${SETUP_FILES[@]}"; do
                if [ -f "$SETUP_FILE.bak" ]; then
                        cleanup_file
                fi
        done
        echo "Cleanup finished!"
}

cd && run
cd $CWD

