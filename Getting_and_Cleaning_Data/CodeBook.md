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

    `				Original													Convert
    1			 tBodyAcc-mean()-X                                           tbodyaccmeanx
    2            tBodyAcc-mean()-Y                                           tbodyaccmeany
    3            tBodyAcc-mean()-Z                                           tbodyaccmeanz
    4             tBodyAcc-std()-X                                            tbodyaccstdx
    5             tBodyAcc-std()-Y                                            tbodyaccstdy
    6             tBodyAcc-std()-Z                                            tbodyaccstdz
    7         tGravityAcc-mean()-X                                        tgravityaccmeanx
    8         tGravityAcc-mean()-Y                                        tgravityaccmeany
    9         tGravityAcc-mean()-Z                                        tgravityaccmeanz
    10         tGravityAcc-std()-X                                         tgravityaccstdx
    11         tGravityAcc-std()-Y                                         tgravityaccstdy
    12         tGravityAcc-std()-Z                                         tgravityaccstdz
    13       tBodyAccJerk-mean()-X                                       tbodyaccjerkmeanx
    14       tBodyAccJerk-mean()-Y                                       tbodyaccjerkmeany
    15       tBodyAccJerk-mean()-Z                                       tbodyaccjerkmeanz
    16        tBodyAccJerk-std()-X                                        tbodyaccjerkstdx
    17        tBodyAccJerk-std()-Y                                        tbodyaccjerkstdy
    18        tBodyAccJerk-std()-Z                                        tbodyaccjerkstdz
    19          tBodyGyro-mean()-X                                          tbodygyromeanx
    20          tBodyGyro-mean()-Y                                          tbodygyromeany
    21          tBodyGyro-mean()-Z                                          tbodygyromeanz
    22           tBodyGyro-std()-X                                           tbodygyrostdx
    23           tBodyGyro-std()-Y                                           tbodygyrostdy
    24           tBodyGyro-std()-Z                                           tbodygyrostdz
    25      tBodyGyroJerk-mean()-X                                      tbodygyrojerkmeanx
    26      tBodyGyroJerk-mean()-Y                                      tbodygyrojerkmeany
    27      tBodyGyroJerk-mean()-Z                                      tbodygyrojerkmeanz
    28       tBodyGyroJerk-std()-X                                       tbodygyrojerkstdx
    29       tBodyGyroJerk-std()-Y                                       tbodygyrojerkstdy
    30       tBodyGyroJerk-std()-Z                                       tbodygyrojerkstdz
    31          tBodyAccMag-mean()                                         tbodyaccmagmean
    32           tBodyAccMag-std()                                          tbodyaccmagstd
    33       tGravityAccMag-mean()                                      tgravityaccmagmean
    34        tGravityAccMag-std()                                       tgravityaccmagstd
    35      tBodyAccJerkMag-mean()                                     tbodyaccjerkmagmean
    36       tBodyAccJerkMag-std()                                      tbodyaccjerkmagstd
    37         tBodyGyroMag-mean()                                        tbodygyromagmean
    38          tBodyGyroMag-std()                                         tbodygyromagstd
    39     tBodyGyroJerkMag-mean()                                    tbodygyrojerkmagmean
    40      tBodyGyroJerkMag-std()                                     tbodygyrojerkmagstd
    41           fBodyAcc-mean()-X                                           fbodyaccmeanx
    42           fBodyAcc-mean()-Y                                           fbodyaccmeany
    43           fBodyAcc-mean()-Z                                           fbodyaccmeanz
    44            fBodyAcc-std()-X                                            fbodyaccstdx
    45            fBodyAcc-std()-Y                                            fbodyaccstdy
    46            fBodyAcc-std()-Z                                            fbodyaccstdz
    47       fBodyAccJerk-mean()-X                                       fbodyaccjerkmeanx
    48       fBodyAccJerk-mean()-Y                                       fbodyaccjerkmeany
    49       fBodyAccJerk-mean()-Z                                       fbodyaccjerkmeanz
    50        fBodyAccJerk-std()-X                                        fbodyaccjerkstdx
    51        fBodyAccJerk-std()-Y                                        fbodyaccjerkstdy
    52        fBodyAccJerk-std()-Z                                        fbodyaccjerkstdz
    53          fBodyGyro-mean()-X                                          fbodygyromeanx
    54          fBodyGyro-mean()-Y                                          fbodygyromeany
    55          fBodyGyro-mean()-Z                                          fbodygyromeanz
    56           fBodyGyro-std()-X                                           fbodygyrostdx
    57           fBodyGyro-std()-Y                                           fbodygyrostdy
    58           fBodyGyro-std()-Z                                           fbodygyrostdz
    59          fBodyAccMag-mean()                                         fbodyaccmagmean
    60           fBodyAccMag-std()                                          fbodyaccmagstd
    61  fBodyBodyAccJerkMag-mean()                                 fbodybodyaccjerkmagmean
    62   fBodyBodyAccJerkMag-std()                                  fbodybodyaccjerkmagstd
    63     fBodyBodyGyroMag-mean()                                    fbodybodygyromagmean
    64      fBodyBodyGyroMag-std()                                     fbodybodygyromagstd
    65 fBodyBodyGyroJerkMag-mean()                                fbodybodygyrojerkmagmean
    66  fBodyBodyGyroJerkMag-std()                                 fbodybodygyrojerkmagstd`

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