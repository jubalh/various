#!/bin/bash
#Backup Folder should look like this:
#/mnt/exthd/backup/ wherin is this script
#/mnt/exthd/backup/data/ wherin is all the data

#DEBUG:
#set -x

BACKUP_DIR=$3

USR=$USER
USR_HOME=~$USR
DEST_BASE=''
SOURCE_BASE=''
DEST=''

if [[ $1 == "save" ]]; then
	DEST_BASE = $BACKUP_DIR
	SOURCE_BASE = $USR_HOME
elif [[ $1 == "load" ]]; then
	DEST_BASE = $USR_HOME
	SOURCE_BASE = $BACKUP_DIR
else
	usage
fi

function usage(){
	echo "Run: \"heimstall save\" to back your data up"
	echo "Run: \"heimstall load\" to retrieve your data"
	exit 1
}

function copy(){
	if [ -z "$2" ]; then
		DEST = $1
	else
		DEST = $2
	fi

	echo "copying "$1
	rsync -av --progress $SOURCE_BASE/$1 $DEST_BASE/$DEST
	echo "done"
}

echo
echo 'Backup Script'
echo

copy el
#TODO: text dir, code dir, vimwiki dir, i3 config, gitconfig und so weiter auch einbauen
