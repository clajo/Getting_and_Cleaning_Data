## This is the course project for Getting and Cleaning Data.

In CodeBook.md you can find more information about the data that has been used.

A full description of the dataset is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and data used in the project can be obtained here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Download the data and set the folder 'UCI HAR Dataset' as your working directory.

This R code in run_analysis.R reads data from the 'UCI HAR Dataset'. It combine training and test data, transfors it into a data frame with one row per subject and activity, calculates mean over all mean() or std() variables.
The final data frame is exported to grouped_tidydata.txt.



