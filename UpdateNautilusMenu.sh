#!/bin/bash

# update /home/samman/.local/share/nautilus/scripts
sourceFolder="/home/samman/Documents/MyGitHub/UbuntuMenuScripts/scripts"
# make all files in sourceFolder executable
# find recursively all files in sourceFolder and make them executable
find $sourceFolder -type f -exec chmod +x {} \;
# # copy all files in sourceFolder to /home/samman/.local/share/nautilus/scripts
cp -r $sourceFolder/* /home/samman/.local/share/nautilus/scripts