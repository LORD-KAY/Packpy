#!/bin/bash
APPNAME="Packpy v1.0.0";
HOSTNAME=`hostname`;
INIT_FILE="__init__.py";
MANIFEST="MANIFEST";
SETUP="setup.py";
SETUPCFG="setup.cfg";

# Other folders
TESTFOLDER="test";

# Begining the installer by processing using user argument - Package Name
read -p "Enter Your Package Name: -> " package;
package_name=$package;

# Creating the mother functions
function BASEFOLDER_CREATION(){
	sleep 2
	mkdir $current_folder;
	chmod 777 $current_folder;
	cd $current_folder && touch $INIT_FILE;
	chmod 777 $INIT_FILE;
}

function FILES_CREATION(){
		# Writing to the init file
		file_header="#!/bin/env/python";
		imports="from __future__ import absolute_import,division, print_function";
		all_configs='__all__ = (
    "__title__", "__summary__", "__uri__", "__version__", "__author__",
    "__email__", "__license__", "__copyright__",
	)';

		echo "$file_header" >> $INIT_FILE;
		echo "$imports" >> $INIT_FILE;
		echo "$all_configs" >> $INIT_FILE;

		# Writing other information to the init file
		title='"'$current_folder'"';
		echo " " >> $INIT_FILE;
		echo "__title__ = $title" >> $INIT_FILE;
		read -p "Package Summary :-> " summary;
		summary_data='"'$summary'"';
		echo "__summary__ = $summary_data" >> $INIT_FILE;
		read -p "Package URI (Mostly github repository): -> " uri;
		url='"'$uri'"';
		echo "__uri__ = $url" >> $INIT_FILE;
		# DEFINING AN EMPTY SPACE ABOVE
		echo " " >> $INIT_FILE;
		echo "__version__ = $version_number" >> $INIT_FILE;
		echo " " >> $INIT_FILE;

		read -p "Package Author: -> " author;
		devname='"'$author'"';
		echo "__uri__ = $devname" >> $INIT_FILE;
		read -p "Author Email: -> " email;
		email_address='"'$emai'"';
		echo "__email__ = $email" >> $INIT_FILE;
		read -p "Licence Under: -> " license;
		if [[ -z "$license" ]]; then
			license='"MIT"';
			echo " " >> $INIT_FILE;
			echo "__license__ = $license" >> $INIT_FILE;
			echo " " >> $INIT_FILE;
		else
			license='"'$license'"';
			echo " " >> $INIT_FILE;
			echo "__license__ = $license" >> $INIT_FILE;
			echo " " >> $INIT_FILE;
		fi
		
	
		# CREATING OTHER NECCESSARY FILES
		touch $MANIFEST && chmod 755 $MANIFEST;
		touch $SETUP && chmod 755 $SETUP;
		touch $SETUPCFG && chmod 755 $SETUPCFG;

		sleep 4
		# Create the package folder and the its file using the same package folder name
		mkdir $current_folder;
		cd $current_folder && touch "$current_folder.py";
		chmod 755 "$current_folder.py";
}
# Creating the package folder
if [[ -z "$package_name" ]]; then
	# Get the current working directory name
	current_folder=${PWD##*/};
	#Calling the method
	BASEFOLDER_CREATION
	read -p "Package Version (v1.0.0) : -> " version;
	version_number=$version;
	if [[ -z "$version_number" ]]; then
		version_number='"v1.0.0"';
		FILES_CREATION
	else
		version_number=$version_number;
		FILES_CREATION
	fi

else
	# When Variables are not empty
	current_folder=$package_name;
	BASEFOLDER_CREATION
	read -p "Package Version (v1.0.0) : -> " version;
	version_number=$version;
	if [[ -z "$version_number" ]]; then
		version_number='"v1.0.0"';
		FILES_CREATION
	else
		version_number=$version_number;
		FILES_CREATION
	fi
fi


