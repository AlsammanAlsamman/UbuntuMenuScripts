#!/usr/bin/env Rscript

############################################## About Author #########################################
# Created by: Alsamman M. Alsamman                                                                  #
# Emails: smahmoud [at] ageri.sci.eg or A.Alsamman [at] cgiar.org or SammanMohammed [at] gmail.com  #
# License: MIT License - https://opensource.org/licenses/MIT                                        #
# Disclaimer: The script comes with no warranty, use at your own risk                               #
# This script is not intended for commercial use                                                    #
#####################################################################################################

args = commandArgs(trailingOnly=TRUE)

# test if there is at least one argument: if not, return an error
if (length(args)==0) {
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
}

# What is this system linux or windows
system<-Sys.info()[1]
# if system is windows then change the path separator
if (system=="Windows") {
  pathSeparator<-"\\"
} else {
  pathSeparator<-"/"
}

#######################################################################################

args = commandArgs(trailingOnly=TRUE)

if (length(args) < 3) {
  print(paste("Usage: Rscript columnFactorizeLong <table file> <column number> <output file> <separator>"))
  quit()
}

tableFile<-args[1]
outFile<-args[2]

separator<-"\t"
if (length(args) < 4) {
  print("separator is given")
  # get the separator from the file extension
  if (grepl("\\.csv$",tableFile)) {
    separator<-","
  } else if (grepl("\\.tsv$",tableFile)) {
    separator<-"\t"
  } else if (grepl("\\.txt$",tableFile)) {
    separator<-" "
  } else {
    separator<-"\t"
  }
}
# print all arguments
print(paste("args:",length(args)))
print(paste("tableFile:",tableFile))
print(paste("outFile:",outFile))
print(paste("columnNumber:",columnNumber))
print(paste("separator:",separator))

# tableFile<-"/home/samman/Documents/ICARDA_Zakaria/Tasks/Nassima_5_23_12_2023/Data/MetaData.csv"
# outFile<-"/home/samman/Documents/ICARDA_Zakaria/Tasks/Nassima_5_23_12_2023/Data/MetaDataNew.csv"
# columnNumber<-1
# separator<-","
# read the table
table<-read.csv(tableFile, header=TRUE, sep=separator, row.names=1)

# which columns have long values
targetCol<-c()
for (i in 1:ncol(table)) {
  
  if(table[,i] %in% c("0","1")) {
    targetCol<-c(targetCol,i)
  }
  
}

table.colnames<-colnames(table)
outFile<-"/home/samman/Documents/ICARDA_Zakaria/Tasks/Fatima_1/Data/fact/MetaData_fact.csv"
for (columnNumber in targetCol) {
  current.colname<-table.colnames[columnNumber]
  # extract the column
  column<-table[,columnNumber]
  # convert the column to a factor
  column<-as.factor(column)
  # get levels and thier values
  levelsTable<-data.frame(levels(column),1:length(levels(column)))
  # convert the column to a numeric
  column<-as.numeric(column)
  # convert the column to a character
  column<-as.character(column)
  column<-paste(colnames(table)[columnNumber],column,sep=".")
  # replace the column
  table[,columnNumber]<-column
  # write the levels table
  write.csv(levelsTable, file=paste(outFile,"__",current.colname,"__",".levels.csv",sep=""))
}

  write.csv(table, file=paste(outFile,".csv",sep=""))
