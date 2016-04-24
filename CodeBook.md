# Getting and Cleaning Data -Project CodeBook
## Approach for generating the tidy_data.txt dataset

The tidy_data.txt dataset was generate from the dataset provide by the UCI Machine Learning Repository:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

REAME.txt file included with the original dataset provides more details.

The data  represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**The original data was split between training and test data. Both were merged for the purpose of creating the tidy_data.txt dataset.**

**Only 66 features from the original 561 features were extracted for the assignment: those that are means or standard deviations e.g. variables containing -mean() or -std() in their name (features whose names include gravityMean or meanFreq were not included).**

The 561 features selected for the original database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

**The tidy_data.txt dataset was created by calculating the average per activity per subject of each of the 66 extracted features.**

## Variables in the tidy_data.txt dataset

* **subject**: is the subject number
* **activity**: is the activity name as specified in the activity_labels.txt and obtained by matching the activity number

The other variables are the average per activity per subject of each of the 66 extracted features as follow:

* **timebodyacc_mean_xyz** for tBodyAcc-mean()-XYZ|
* **timegravityacc_mean_xyz** for tGravityAcc-mean()-XYZ|
* **timebodyaccjerk_mean_xyz** for tBodyAccJerk-mean()-XYZ
* **timebodygyro_mean_xyz** for tBodyGyro-mean()-XYZ
* **timebodygyrojerk_mean**_xyz for tBodyGyroJerk-mean()-XYZ
* **timebodyaccmag_mean** for tBodyAccMag-mean()
* **timegravityaccmag_mean** for tGravityAccMag-mean()
* **timebodyaccjerkmag_mean** for tBodyAccJerkMag-mean()
* **timebodygyromag_mean** for tBodyGyroMag-mean()
* **timebodygyrojerkmag_mean** for tBodyGyroJerkMag-mean()
* **timebodyacc_std_xyz** for tBodyAcc-std()-XYZ
* **timegravityacc_std_xyz** for tGravityAcc-std()-XYZ
* **timebodyaccjerk_std_xyz** for tBodyAccJerk-std()-XYZ
* **timebodygyro_std_xyz** for tBodyGyro-std()-XYZ
* **timebodygyrojerk_std**_xyz for tBodyGyroJerk-std()-XYZ
* **timebodyaccmag_std** for tBodyAccMag-std()
* **timegravityaccmag_std** for tGravityAccMag-std()
* **timebodyaccjerkmag_std** for tBodyAccJerkMag-std()
* **timebodygyromag_std** for tBodyGyroMag-std()
* **timebodygyrojerkmag_std** for tBodyGyroJerkMag-std()
* **freqbodyacc_mean_xyz** for fBodyAcc-mean()-XYZ
* **freqbodyaccjerk_mean_xyz** for fBodyAccJerk-mean()-XYZ
* **freqbodygyro_mean_xyz** for fBodyGyro-mean()-XYZ
* **freqbodyaccmag_mean_xyz** for fBodyAccMag-mean()
* **freqbodyaccjerkmag_mean** for fBodyAccJerkMag-mean()
* **freqbodygyromag_mean** for fBodyGyroMag-mean()
* **freqbodygyrojerkmag_mea**n for fBodyGyroJerkMag-mean()
* **freqbodyacc_std_xyz** for fBodyAcc-std()-XYZ
* **freqbodyaccjerk_std_xyz** for fBodyAccJerk-std()-XYZ
* **freqbodygyro_std_xyz** for fBodyGyro-std()-XYZ
* **freqbodyaccmag_std_xy**z for fBodyAccMag-std()
* **freqbodyaccjerkmag_std** for fBodyAccJerkMag-std()
* **freqbodygyromag_std** for fBodyGyroMag-std()
* **freqbodygyrojerkmag_std** for fBodyGyroJerkMag-std()

'-xyz' and '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions and are represented as 3 different variables e.g. timebodyacc_mean_xyz is actually timebodyacc_mean_x, timebodyacc_mean_y, timebodyacc_mean_z.

Each observation is the average of the extracted feature for a given activity and subject.

## Notes
* Features are normalized and bounded within [-1,1].
* Some typos in the features names in the original dataset were corrected e.g. BodyBody in the name instead of just Body.

## License (from the original README.txt file)
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
