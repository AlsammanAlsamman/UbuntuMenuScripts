#!/bin/bash

############################################## About Author #########################################
# Created by: Alsamman M. Alsamman                                                                  #
# Emails: smahmoud [at] ageri.sci.eg or A.Alsamman [at] cgiar.org or SammanMohammed [at] gmail.com  #
# License: MIT License - https://opensource.org/licenses/MIT                                        #
# Disclaimer: The script comes with no warranty, use at your own risk                               #
# This script is not intended for commercial use                                                    #
#####################################################################################################

# get info about the selected vcf file SNPs and samples

echo -e "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" | while read line
do
if [ ! -z "$line" -a "$line" != " " ]; then
    # get the filename
    filename="$line"

    # get the number of SNPs
    SNPs=$(grep -v "#" "$filename" | wc -l)
    # get the the CHROM column
    CHROMLINE=0
    while read -r line
    do
        CURRENTLINE=$((CURRENTLINE+1))
        # use perl to find #CHROM line
        if [[ $line =~ ^#CHROM ]]; then
            CHROMLINE=$line
            break
        fi
    done < "$filename"

    # get the number of samples
    IFS=$'\t' read -r -a array <<< "$CHROMLINE"

    # save the array of samples to a file
    echo -e "${array[@]:9}" | tr ' ' '\n' > $filename.samples

    # get the number of samples
    samples=${#array[@]}
    samples=$((samples-9))

    # save the info to a file
    echo -e "File: $filename\nSNPs: $SNPs\nSamples: $samples\n" > $filename.info

fi
done












