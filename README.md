# Getting and Cleaning Data - Project ReadMe file

## Assignment Objective

To create one R script called run_analysis.R that does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The resulting tidy data set is stored in the file called tidy_data.txt in the same directory as the run_analysis.R script.

Note: The script will re-use the previously downloaded data if the directory "UCI HAR Datasetdata" is present.

## Explanations of how the script works

The script does the following:

1. Check if the directory "UCI HAR Dataset" exists before downloading the Dataset. If doesn't it downloads the data, unzip it and delete the original zip file. If does, it reuses the existing data.
2. Load the data:
* features.txt in the featureLabels dataframe
* activity_labels.txt in the activityLabels
* subject_train.txt, subject_test.txt in trainSubjects and testSubjects dataframes
* X_train.txt, X_test.txt in trainX and testX dataframes
* y_train.txt, y_test.txt in trainY and testY dataframes
3. Use rbind() to merge respective test and train data into mergedSubjects, mergedX, mergedY
4. Use factor() to replace the activity identifier by its labels
5. Use setNames() to set the column name for subject as "subject" in mergedSubjects, activity as "activity" in mergedY, and for each column in mergedX using the labels in featureLabels 
6. Update mergeX to include only the columns whose names include -mean() or std() using the grep() function
7. Use cbind() to merge mergedSubjects, mergedY, mergedX. Store the result as mergedAll
8. Use dpply() and colMeans() on mergeAll to calculate the mean of each columns with the features (columns 3:68) per subject and per activity. Store the result as averageAll
9. Use gsub() to update the variable names to make them easier to understand and use in R
10. Write averageAll in the file tidy_data.txt using write.table()



