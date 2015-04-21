library(dplyr)

#Common sets
  activity_labels <- read.table("./activity_labels.txt", header = FALSE, na.strings = FALSE, stringsAsFactors = FALSE)
  activity_labels <- c(activity_labels$V2)

  features <- read.table("./features.txt", header = FALSE, na.strings = FALSE)
  names(features) <- c("fId", "fLabel")

#Test set
  dtLabelsTest <- read.table("./test/Y_test.txt", header = FALSE, na.strings = FALSE)
  dtSubjectTest <- read.table("./test/subject_test.txt", header = FALSE, na.strings = FALSE)
  names(dtLabelsTest) <- "ActLabId"
  names(dtSubjectTest) <- "Subject"
  dtTest <- read.table("./test/X_test.txt", header = FALSE, na.strings = FALSE)
  
    dtTest <- data.frame(dtSubjectTest, dtLabelsTest, dtTest)

#Train set
  dtLabelsTrain <- read.table("./train/Y_train.txt", header = FALSE, na.strings = FALSE)
  dtSubjectTrain <- read.table("./train/subject_train.txt", header = FALSE, na.strings = FALSE)
  names(dtLabelsTrain) <- "ActLabId"
  names(dtSubjectTrain) <- "Subject"
  dtTrain <- read.table("./train/X_train.txt", header = FALSE, na.strings = FALSE)
  
    dtTrain<- data.frame(dtSubjectTrain, dtLabelsTrain, dtTrain)

# 1. Merges the training and the test sets to create one data set.
  dtTrainTest <- rbind(dtTrain, dtTest)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 4. Appropriately labels the data set with descriptive variable names.
  ptn <- 'mean[()]|std[()]'
  ndx = grep(ptn, features$fLabel)
  dtTrainTestSelected <- select(dtTrainTest, c(1,2,ndx+2))
  featuresConvertedLabels <- tolower(gsub("[^[:alpha:]]", "", features$fLabel[ndx]))
  names(dtTrainTestSelected) <- c("Subject","ActLabId",featuresConvertedLabels)

# 3. Uses descriptive activity names to name the activities in the data set
  for( i in 1 : length(activity_labels)){
    dtTrainTestSelected$ActLabId[dtTrainTestSelected$ActLabId == i] <- activity_labels[i]
  }


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  subjets <- unique(dtTrainTestSelected$Subject)
  activitis <- unique(dtTrainTestSelected$ActLabId)

  # Copy dtTrainTestSelected struct
  dtRes <- dtTrainTestSelected[1,]
  
  for(i in 1 : length(subjets)){
    for(j in 1 : length(activitis)){
      # colMeans from http://stackoverflow.com/questions/21807987/calculate-the-mean-for-each-column-of-a-matrix-in-r
      subActRow <- colMeans( select(filter(dtTrainTestSelected, Subject == subjets[i] & ActLabId == activitis[j]), 3:ncol(dtTrainTestSelected)))
      dtRes <- rbind(dtRes,c(subjets[i],activitis[j],subActRow))
    } 
  }
  # Delete first copy row
  dtRes <- dtRes[-1,]
  #Order set (Subject, ActLabId)
  dtRes <- arrange(dtRes, as.integer(Subject), ActLabId)
  write.table(dtRes, "result.txt", row.name=FALSE)