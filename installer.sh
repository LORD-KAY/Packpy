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
	echo $current_folder;
fi


