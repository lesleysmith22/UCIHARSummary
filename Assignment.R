##  Loads the training and the test set data
training <- read.delim("./train/X_train.txt", header = FALSE, sep = "")
traininglabels <- read.delim("./train/y_train.txt", header = FALSE, sep = "")
trainingsubject <- read.delim("./train/subject_train.txt", header = FALSE, sep = "")
  
test <- read.delim("./test/X_test.txt", header = FALSE, sep = "")
testlabels <- read.delim("./test/y_test.txt", header = FALSE, sep = "")
testsubject <- read.delim("./test/subject_test.txt", header = FALSE, sep = "")

activitylabels <- read.delim("./activity_labels.txt", header = FALSE, sep = "")
features <- read.delim("./features.txt", header = FALSE, sep = "")

##  Merges the training and the test sets to create one data set
testset <- cbind(testlabels, testsubject, test)
trainingset <- cbind(traininglabels, trainingsubject, training)
completeset <- rbind(testset, trainingset)

## Extracts only the measurements on the mean and standard deviation for each measurement
meanvector <- grep("\\bmean()\\b",features[,2])
sdvector <-grep("*std()",features[,2])
meanandsdset <- cbind(completeset[,1:2],completeset[,meanvector+2],completeset[,sdvector+2])

##  Uses descriptive activity names to name the activities in the data set
meanandsdset[,1]<-sub("1","Walking", meanandsdset[,1])
meanandsdset[,1]<-sub("2","Walking upstairs", meanandsdset[,1])
meanandsdset[,1]<-sub("3","Walking downstairs", meanandsdset[,1])
meanandsdset[,1]<-sub("4","sitting", meanandsdset[,1])
meanandsdset[,1]<-sub("5","standing", meanandsdset[,1])
meanandsdset[,1]<-sub("6","laying", meanandsdset[,1])

##  Appropriately labels the data set with descriptive variable names
meanlabels <- features[meanvector,2]
sdlabels <- features[sdvector,2]
names(meanandsdset) = c("activity","subject",as.character(meanlabels),as.character(sdlabels))
names(meanandsdset) <- gsub("[()]", "", names(meanandsdset))
names(meanandsdset) <- gsub("[-]", "_", names(meanandsdset))

##  Creates independent tidy data sets with the average of each variable for each activity and each subject.
## requires installation of dplyr package
library("dplyr")
dplyrset <- tbl_df(meanandsdset)
subjectgroup <- group_by(dplyrset, subject)
subjectvectors <- select(subjectgroup,tBodyAcc_mean_X:fBodyBodyGyroJerkMag_std)
subject_average <- summarize_all(subjectgroup, funs(mean))

activitygroup <- group_by(dplyrset, activity)
activityvectors <- select(activitygroup,tBodyAcc_mean_X:fBodyBodyGyroJerkMag_std)
activity_average <- summarize_all(activitygroup, funs(mean))

summaryset <- rbind(subject_average, activity_average)
