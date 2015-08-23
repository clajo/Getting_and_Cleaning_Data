# This R code in run_analysis.R reads data from the 'UCI HAR Dataset'. 
# It combine training and test data, transfors it into a data frame 
# with one row per subject and activity, calculates mean over all mean() and std() variables.
#The final data frame is exported to grouped_tidydata.txt.

#The folder 'UCI HAR Dataset' should be set as working directory.

#Load dplyr library 
library(dplyr)


#--test data------------------------------------------

#read X_test data
x_test<-read.table("test/X_test.txt")
#Read subject_test 
subj_test<-read.table("test/subject_test.txt")
#Read y_test (activity_codes)
y_test<-read.table("test/y_test.txt")

#merge test data into a data.frame data_test 
data_test<-data.frame(subj_test,y_test,x_test)



#--training data-----------------------------------------

#read X_train data
x_train<-read.table("train/X_train.txt")
#Read subject_train 
subj_train<-read.table("train/subject_train.txt")
#Read y_train (activity_codes)
y_train<-read.table("train/y_train.txt")

#merge train data into a data.frame data_train
data_train<-data.frame(subj_train,y_train,x_train)


#--concatenated data----------------------------------

#Concatinate data_test and data_train into data 
data<-rbind(data_test,data_train)

#Read in features
features<-read.table("features.txt")

#Add column names to trans
colnames(data)<-c("subject","activity_code",as.character(features[,2]))

#Read activity_labels
activity<-read.table("activity_labels.txt")
#Add column names to Activity
colnames(activity)<-c("activity_code","activity")

#Merge activity names to data and select subject, activity, columns with names including mean() or std()
data<-merge(activity,data)%>%select(subject,activity,matches("mean()"),matches("std()"))

#Group data by subject and activity and use function mean over all value columns
grouped_tidydata<-data %>% group_by(subject,activity) %>% summarise_each(funs(mean))

#export data frame grouped to grouped_tidydata.txt
write.table(grouped_tidydata,file="grouped_tidydata.txt",row.names = FALSE)

#Cleaning
rm(activity,data,data_test,data_train,features,subj_test,subj_train,x_test,x_train,y_test,y_train,grouped_tidydata)
detach("package:dplyr", unload=TRUE)
