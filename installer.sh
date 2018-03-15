#!/bin/bash
APPNAME="Packpy v1.0.0";
HOSTNAME=`hostname`;

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
else
	sleep 2
	mkdir $package_name;
	chmod 777 $package_name;
fi

read -p "Package Version (v1.0.0) : -> " version;
version_number=$version;
if [[ -z "$version_number" ]]; then
	version_number="v1.0.0";
else
	version=$version_number;
fi


