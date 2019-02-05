# Readme for run_analysis.r
## What is inside
* Overview 
* Requirements
* Data Source
* Methods & Decisions

## Overview 
The run_analysis.r script combines two sets of activity tracker observations for a total of 30 subjects doing 6 activities.

* Initially there are 10299 observations of 563 variables in the data source. This complete data table is kept in the environment as 'full_set'
* I've extracted only the columns that represent a mean or standard deviation value. This smaller data table is kept in the environment as 'smaller_set'
* From here I've grouped the observations by activity type and summarized the values by their average for each subject. This compresses the 10299 observations to just 180. Our final data table is 180 observations by 81 variables.  It will be written to the './UCI HAR Dataset/' folder in your working directory.

## Requirements
The script should be in your working directory. The script assumes you've extracted the zip file below and the folder structure into the working directory.  For example, the script will look for the features.txt file at ./UCI HAR Dataset/features.txt

The script also uses the readr, plyr, and dplyr libraries.

## Data Source
Activity Tracker Data downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
on Feb 2, 2019.

More information about this dataset at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Methods and Decisions
Yes this could be written without plyr, dplyr, readr. It was more fun to use them.
I ended up using read_delim, but read.table would have been just fine.
I decided that properly adding in the features as the header values was clear enough since turning them to text would make even longer column names.  You might disagree.
I decided to remove data tables used temporarily, but kept a few so people can go back to them. I also decided to make subject and activity factors since they were going to act that way, unsure if I need to.

## Thanks
