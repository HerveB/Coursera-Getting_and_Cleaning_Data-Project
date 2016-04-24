## Getting and Cleaning Data Course Project

## Load libraries
library(plyr)


## Download and unzip the data
if(!dir.exists(("UCI HAR Dataset"))) {
  ## Download dataset if data has not already been downloaded
  message("Downloading dataset")
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  fileName <- "ZippedFiles.zip"
  download.file(fileUrl, destfile = fileName, method = "curl")
  
  ## Unzip files and remove zip archive file
  unzip(fileName)
  file.remove("ZippedFiles.zip")
} else {
  message("Reusing prevously downloaded data")
}

## Load the data
message("Loading data")
## Change the working directory to where the files were extracted
setwd("./UCI HAR Dataset")

## Load feature labels
featureLabels <-read.table("features.txt", sep =" ")

## Load Activity laberls
activityLabels <-read.table("activity_labels.txt", sep =" ")

## Load subject ID
trainSubjects <- read.table("./train/subject_train.txt")
testSubjects <- read.table("./test/subject_test.txt")

## Load X data
trainX <- read.table("./train/X_train.txt")
testX <- read.table("./test/X_test.txt")

## Load Y data
trainY <- read.table("./train/y_train.txt")
testY <- read.table("./test/y_test.txt")

## Merge train and test datasets
message("Merging test and training data")
mergedSubjects <- rbind(trainSubjects, testSubjects)
mergedX <- rbind(trainX, testX)
mergedY <- rbind(trainY, testY)

## Delete objects that are no longer needed
rm(trainX)
rm(trainY)
rm(testX)
rm(testY)
rm(trainSubjects)
rm(testSubjects)

## Replace activity id by descriptive activity name
mergedY <- data.frame(factor(mergedY[,1], levels = activityLabels[,1], labels = activityLabels[,2]))

## Rename columns
mergedSubjects <- setNames(mergedSubjects, "subject")
mergedY <- setNames(mergedY, "activity")
mergedX <- setNames(mergedX, featureLabels[,2])

## Extracts only the measurements on the mean and standard deviation for each measurement
## Only features with mean() or std() in their lable were kept
## Features whose names include gravityMean or meanFreq() were not kept
mergedX <- mergedX[, grep("-(mean|std)\\(", featureLabels[,2])]

## merge subjects, X, Y datasets
mergedAll <- cbind(mergedSubjects, mergedY, mergedX)

## Delete objects that are no longer needed
rm(mergedX)
rm(mergedY)
rm(mergedSubjects)

## Summarize data
message("Summarizing data and making data tidy")
averageAll <- ddply(mergedAll, .(subject, activity), function(x) colMeans(x[, 3:68]))

## Clean update the columns names to make it easier to use them in R without having to escape some of the special chatacters
names(averageAll) <- tolower(names(averageAll)) ## Change all characters to lower caps
names(averageAll) <- gsub("bodybody", "body", names(averageAll)) ## remove the duplicate word "body"
names(averageAll) <- gsub("^t", "time", names(averageAll)) ## Replace t by time
names(averageAll) <- gsub("^f", "freq", names(averageAll)) ## Replace t by freq
names(averageAll) <- gsub("\\(\\)|\\(\\)-|-", "_", names(averageAll)) ## Replace () - by _ (I found it clearer than without)
names(averageAll) <- gsub("_$", "", names(averageAll)) ## remove any trailing _

## Create files with tidy dataset
message("Writing tidy_data.txt file")
setwd("../")
write.table(averageAll, "tidy_data.txt", row.name=FALSE)
