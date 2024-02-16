#!/usr/bin/python

############################################## About Author #########################################
# Created by: Alsamman M. Alsamman                                                                  #
# Emails: smahmoud [at] ageri.sci.eg or A.Alsamman [at] cgiar.org or SammanMohammed [at] gmail.com  #
# License: MIT License - https://opensource.org/licenses/MIT                                        #
# Disclaimer: The script comes with no warranty, use at your own risk                               #
# This script is not intended for commercial use                                                    #
#####################################################################################################

# convert Fasta File to Table for supplementary data

import sys
import os

def readFasta(fastaFile):
    fastaDict = {}
    with open(fastaFile, 'r') as f:
        for line in f:
            line = line.strip()
            if line.startswith('>'):
                header = line[1:]
                fastaDict[header] = ''
            else:
                fastaDict[header] += line
    return fastaDict

def writeTable(fastaDict, outFile):
    with open(outFile, 'w') as f:
        for header, seq in fastaDict.items():
            f.write(header + '\t' + seq + '\n')

def main():
    if len(sys.argv) != 3:
        print('Usage: python fasta2Table.py <fastaFile> <outFile>')
        sys.exit(1)
    fastaFile = sys.argv[1]
    outFile = sys.argv[2]
    fastaDict = readFasta(fastaFile)
    writeTable(fastaDict, outFile)

if __name__ == '__main__':
    main()
