## Getting and Cleaning Data Course Project

## Load libraries
library(plyr)
library(dplyr)


## Download and unzip the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- "ZippedFiles.zip"
download.file(fileUrl, destfile = fileName, method = "curl")
unzip(fileName)

## Load the data
## Change the working directory to where the files were extracted
setwd("./UCI HAR Dataset")

## Load feature labels
feature_labels <-read.table("features.txt", sep =" ")

## Load Activity laberls
activity_labels <-read.table("activity_labels.txt", sep =" ")

## Load subject ID
train_subjects <- read.table("./train/subject_train.txt")
test_subjects <- read.table("./test/subject_test.txt")

## Load X data
train_X <- read.table("./train/X_train.txt")
test_X <- read.table("./test/X_test.txt")

## Load Y data
train_Y <- read.table("./train/y_train.txt")
test_Y <- read.table("./test/y_test.txt")

## Merge train and test datasets
merged_subject <- rbind(train_subjects, test_subjects)
merged_X <- rbind(train_X, test_X)
merged_Y <- rbind(train_Y, test_Y)

## Replace activity id by descriptive activity name
merged_Y <- data.frame(factor(merged_Y[,1], levels = activity_labels[,1], labels = activity_labels[,2]))

## Rename columns
merged_subject <- setNames(merged_subject, "subject")
merged_Y <- setNames(merged_Y, "activity")
merged_X <- setNames(merged_X, feature_labels[,2])

## Extracts only the measurements on the mean and standard deviation for each measurement
merged_X <- merged_X[, grep("-(mean|std)\\(", feature_labels[,2])]

## merge subjects, X, Y datasets
merged_all <- cbind(merged_subject, merged_Y, merged_X)

## Summarize data
average_all <- ddply(merged_all, .(subject, activity), function(x) colMeans(x[, 3:68]))

## Clean update the columns names to make it easier to use them in R without having to escape some of the special chatacters
names(average_all) <- tolower(gsub("_$", "", (gsub("\\(\\)|\\(\\)-|-", "_", names(average_all))))) ## Replace () - by _ and remove any trailing _
write.table(average_all, "../tidy_data.txt", row.name=FALSE)
