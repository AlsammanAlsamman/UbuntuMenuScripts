#!/usr/bin/python

############################################## About Author #########################################
# Created by: Alsamman M. Alsamman                                                                  #
# Emails: smahmoud [at] ageri.sci.eg or A.Alsamman [at] cgiar.org or SammanMohammed [at] gmail.com  #
# License: MIT License - https://opensource.org/licenses/MIT                                        #
# Disclaimer: The script comes with no warranty, use at your own risk                               #
# This script is not intended for commercial use                                                    #
#####################################################################################################

import sys

# if no arguments provided print the help message
if len(sys.argv) == 1:
    print("Usage: sortTableByList.py <table> <list> <output>")
    print("Example: sortTableByList.py table.txt list.txt sortedTable.txt")
    sys.exit(1)
    
# check that we have 3 arguments
if len(sys.argv) != 4:
    print("Error: 3 arguments are required")
    sys.exit(1)

# sort a table by a list of index/rownames

def readTable(filepath):
    # read table and return a Dictionary
    table = {}
    with open(filepath, 'r') as f:
        for line in f:
            line = line.strip()
            if line:
                line = line.split("\t")
                table[line[0]] = "\t".join(line)
    return table

def readList(filepath):
    # read list and return a list
    with open(filepath, 'r') as f:
        return [line.strip() for line in f]

def writeTable(table, filepath):
    # write table to a file
    with open(filepath, 'w') as f:
        for key in table:
            f.write(table[key] + "\n")

def sortTableByList(table, list):
    # sort table by list
    sortedTable = {}
    for key in list:
        if key in table:
            sortedTable[key] = table[key]
    return sortedTable

# read table
table = readTable(sys.argv[1])
# read list
list = readList(sys.argv[2])
# sort table by list
sortedTable = sortTableByList(table, list)
# write table
writeTable(sortedTable, sys.argv[3])



