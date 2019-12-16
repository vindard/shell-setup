#!/bin/bash


CWD=$(pwd)
TEMPFILE=temp.txt

cd
SETUP_FILES=(.commonrc .bash_aliases)

SETUP_FILE=.commonrc

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

run

