#!/bin/bash
APPNAME="Packpy v1.0.0";
HOSTNAME=`hostname`;

# Begining the installer by processing using user argument - Package Name
read -p "Enter Your Package Name: -> " package;
package_name=$package;
# Creating the package folder
if [[ $package_name ==  ' ' ]]; then
	
fi
sleep 2
mkdir $package_name;
chmod 777 $package_name;

read -p ""

