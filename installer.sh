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
# Creating the package folder
if [[ -z "$package_name" ]]; then
	# Get the current working directory name
	current_folder=${PWD##*/};
	sleep 2
	mkdir $current_folder;
	chmod 777 $current_folder;
	cd $current_folder && touch $INIT_FILE;
	chmod 777 $INIT_FILE;

	read -p "Package Version (v1.0.0) : -> " version;
	version_number=$version;
	if [[ -z "$version_number" ]]; then
		version_number="v1.0.0";
		# Writing to the init file
		file_header="#!/bin/env/python";
		imports="from __future__ import absolute_import,division, print_function";
		all_configs='
		__all__ = (
    "__title__", "__summary__", "__uri__", "__version__", "__author__",
    "__email__", "__license__", "__copyright__",
	)';
		echo "$file_header" >> $INIT_FILE;
		echo "$imports" >> $INIT_FILE;
		echo "$all_configs" >> $INIT_FILE;
	
		# CREATING OTHER NECCESSARY FILES
		touch $MANIFEST && chmod 755 $MANIFEST;
		touch $SETUP && chmod 755 $SETUP;
		touch $SETUPCFG && chmod 755 $SETUPCFG;

		sleep 4
		# Create the package folder and the its file using the same package folder name
		mkdir $current_folder;
		cd $current_folder && touch "$current_folder.py";
		chmod "$current_folder.py";
	else
		version=$version_number;
	fi

else
	# When Variables are not empty
	sleep 2
	mkdir $package_name;
	chmod 777 $package_name;
	cd $current_folder;
fi


