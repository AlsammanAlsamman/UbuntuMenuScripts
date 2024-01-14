#!/bin/bash

############################################## About Author #########################################
# Created by: Alsamman M. Alsamman                                                                  #
# Emails: smahmoud [at] ageri.sci.eg or A.Alsamman [at] cgiar.org or SammanMohammed [at] gmail.com  #
# License: MIT License - https://opensource.org/licenses/MIT                                        #
# Disclaimer: The script comes with no warranty, use at your own risk                               #
# This script is not intended for commercial use                                                    #
#####################################################################################################

# Latex .tex to pdf
#sudo apt-get install texlive

echo -e "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" | while read line
do
if [ ! -z "$line" -a "$line" != " " ]; then

pdftex "$line"

fi
done 












