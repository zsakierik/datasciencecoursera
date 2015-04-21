# Getting and Cleaning Data Course Project Code Book
## Original description and source
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##The attached run_analysis.R performs the following:


Make one set from test folder components:
* First col from ./test/subject_test.txt, name is "Subject"
* Second col from ./test/Y_test.txt, name is "ActLabId" (activity_labels id)
* Other col from ./test/X_test.txt, this is features names

Make one set from train folder components:
* First col from ./train/subject_train.txt, name is "Subject"
* Second col from ./train/Y_train.txt, name is "ActLabId" (activity_labels id)
* Other col from ./train/X_train.txt, this is features names

Merges the train and test sets to create one data set. 

On this merged set, used only the measurements on the mean() and std()
* Used ... tGravityAcc-mean()-Z, tGravityAcc-std()-X ... etc.
* Not used ... tBodyAcc-arCoeff()-Z,4, tBodyAcc-correlation()-X,Y ... etc.
* And convert the features names, only small letters of the English alphabet contains the name.

| Original| Convert
|-----------------|--------------|
|tBodyAcc-mean()-X|tbodyaccmeanx|
|tBodyAcc-mean()-Y|tbodyaccmeany|
|tBodyAcc-mean()-Z|tbodyaccmeanz|
|tBodyAcc-std()-X|tbodyaccstdx|
|tBodyAcc-std()-Y|tbodyaccstdy|
|tBodyAcc-std()-Z|tbodyaccstdz|
|tGravityAcc-mean()-X|tgravityaccmeanx|
|tGravityAcc-mean()-Y|tgravityaccmeany|
|tGravityAcc-mean()-Z|tgravityaccmeanz|
|tGravityAcc-std()-X|tgravityaccstdx|
|tGravityAcc-std()-Y|tgravityaccstdy|
|tGravityAcc-std()-Z|tgravityaccstdz|
|tBodyAccJerk-mean()-X|tbodyaccjerkmeanx|
|tBodyAccJerk-mean()-Y|tbodyaccjerkmeany|
|tBodyAccJerk-mean()-Z|tbodyaccjerkmeanz|
|tBodyAccJerk-std()-X|tbodyaccjerkstdx|
|tBodyAccJerk-std()-Y|tbodyaccjerkstdy|
|tBodyAccJerk-std()-Z|tbodyaccjerkstdz|
|tBodyGyro-mean()-X|tbodygyromeanx|
|tBodyGyro-mean()-Y|tbodygyromeany|
|tBodyGyro-mean()-Z|tbodygyromeanz|
|tBodyGyro-std()-X|tbodygyrostdx|
|tBodyGyro-std()-Y|tbodygyrostdy|
|tBodyGyro-std()-Z|tbodygyrostdz|
|tBodyGyroJerk-mean()-X|tbodygyrojerkmeanx|
|tBodyGyroJerk-mean()-Y|tbodygyrojerkmeany|
|tBodyGyroJerk-mean()-Z|tbodygyrojerkmeanz|
|tBodyGyroJerk-std()-X|tbodygyrojerkstdx|
|tBodyGyroJerk-std()-Y|tbodygyrojerkstdy|
|tBodyGyroJerk-std()-Z|tbodygyrojerkstdz|
|tBodyAccMag-mean()|tbodyaccmagmean|
|tBodyAccMag-std()|tbodyaccmagstd|
|tGravityAccMag-mean()|tgravityaccmagmean|
|tGravityAccMag-std()|tgravityaccmagstd|
|tBodyAccJerkMag-mean()|tbodyaccjerkmagmean|
|tBodyAccJerkMag-std()|tbodyaccjerkmagstd|
|tBodyGyroMag-mean()|tbodygyromagmean|
|tBodyGyroMag-std()|tbodygyromagstd|
|tBodyGyroJerkMag-mean()|tbodygyrojerkmagmean|
|tBodyGyroJerkMag-std()|tbodygyrojerkmagstd|
|fBodyAcc-mean()-X|fbodyaccmeanx|
|fBodyAcc-mean()-Y|fbodyaccmeany|
|fBodyAcc-mean()-Z|fbodyaccmeanz|
|fBodyAcc-std()-X|fbodyaccstdx|
|fBodyAcc-std()-Y|fbodyaccstdy|
|fBodyAcc-std()-Z|fbodyaccstdz|
|fBodyAccJerk-mean()-X|fbodyaccjerkmeanx|
|fBodyAccJerk-mean()-Y|fbodyaccjerkmeany|
|fBodyAccJerk-mean()-Z|fbodyaccjerkmeanz|
|fBodyAccJerk-std()-X|fbodyaccjerkstdx|
|fBodyAccJerk-std()-Y|fbodyaccjerkstdy|
|fBodyAccJerk-std()-Z|fbodyaccjerkstdz|
|fBodyGyro-mean()-X|fbodygyromeanx|
|fBodyGyro-mean()-Y|fbodygyromeany|
|fBodyGyro-mean()-Z|fbodygyromeanz|
|fBodyGyro-std()-X|fbodygyrostdx|
|fBodyGyro-std()-Y|fbodygyrostdy|
|fBodyGyro-std()-Z|fbodygyrostdz|
|fBodyAccMag-mean()|fbodyaccmagmean|
|fBodyAccMag-std()|fbodyaccmagstd|
|fBodyBodyAccJerkMag-mean()|fbodybodyaccjerkmagmean|
|fBodyBodyAccJerkMag-std()|fbodybodyaccjerkmagstd|
|fBodyBodyGyroMag-mean()|fbodybodygyromagmean|
|fBodyBodyGyroMag-std()|fbodybodygyromagstd|
|fBodyBodyGyroJerkMag-mean()|fbodybodygyrojerkmagmean|
|fBodyBodyGyroJerkMag-std()|fbodybodygyrojerkmagstd|

I changed the the activity_labels id to activity_label values

    1 WALKING
    2 WALKING_UPSTAIRS
    3 WALKING_DOWNSTAIRS
    4 SITTING
    5 STANDING
    6 LAYING

Finally, the script creates data set with the average of each measurement for each activity and each subject.
* This data frame contains 180 rows and 68 cols
* Rows contains 30 subjects and 6 activities, and then the averages for each of the 66 attributes are in columns 3...68