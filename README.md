# Getting and Cleaning Data Project

This repo contains the data for the project of Coursera Getting and Cleaning Data :
 - R file "run_analysis.R"
 - The code book describing the variables used in the .R file

 The working directoty must be the root folder of the data project

 This script runs directely in you use it of the data given with the project
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


* The script firt merges the training and tests sets (xtest and xtest). The dataset has now 10299 observation of 561 variables)
* Then it adds the proper labels on the variables, so we can filter them in the next step
* A new dataset is created df_x2, that is df_x1 with only the variables containing "mean" and "std" : 79 variables (same # of variations)
* Next it adds the activities to the dataset with their names
* Finally it groups the dataset by Activities and Subjects and then outpouts the result in a file called "tidy_data.txt"

Note that the final result might not be the one expected (I still having trouble with the summarize function)