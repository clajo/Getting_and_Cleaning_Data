## This is the course project for Getting and Cleaning Data.

In CodeBook.md you can find more information about the data that has been used.

A full description of the dataset is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and data used in the project can be obtained here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Download the data and set the folder 'UCI HAR Dataset' as your working directory.

The R code in run_analysis.R combines training and test data, creating a tidy dataset with the average of each variable for each activity and each subject.
Only mean and std variables from the data sourses are used.

The result is stored into the textfile grouped_tidydata.txt.



