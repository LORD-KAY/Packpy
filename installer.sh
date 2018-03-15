#!/bin/bash
APPNAME="Packpy v1.0.0";
HOSTNAME=`hostname`;
INIT_FILE="__init__.py";

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
	cd $current_folder;
else
	sleep 2
	mkdir $package_name;
	chmod 777 $package_name;
	cd $current_folder;
fi

read -p "Package Version (v1.0.0) : -> " version;
version_number=$version;
if [[ -z "$version_number" ]]; then
	version_number="v1.0.0";

	# Writing to the init file
	# header="
	# from __future__ import absolute_import,division, print_function
	# ";
	# echo "$header" > $INIT_FILE;
else
	version=$version_number;
fi


