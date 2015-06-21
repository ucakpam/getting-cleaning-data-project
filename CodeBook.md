Code Book for Getting and Cleaning Data Project  
==========================================

# Description 
This file contains information about the variables, data and any transformations or work performed to clean up the data used in the project for the Coursera course [Getting and Cleaning Data](https://www.coursera.org/course/getdata).

# Raw Data Set

The raw data set for the project is obtained from the Human Activity Recognition database (of the UCI Machine Learning repository) and is located here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data set was built from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.   

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  

A full description of the data set is available at: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


# Data Transformations

The `run_analysis.R` R script transforms the raw data into a tidy data set, which is then written to the `tidy_data.txt` file. The following transformations are carried out:

__Merging training and test data sets__:
Test and training signals (`X_train.txt`, `X_test.txt`), activities IDs (`y_train.txt`, `y_test.txt`), and subject IDs (`subject_train.txt`, `subject_test.txt`) are joined together to create a single data set. 

__Extracting mean and standard deviation for each signal measurement__:
Only the mean value and standard deviation variables (i.e., variables that contain the labels `mean()` and `std()` in `features.txt`) are extracted for each measurement.

__Assigning descriptive activity names__:
Activity IDs are replaced by their respective description (based on `activity_labels.txt`).

__Assigning meaningful variable labels__:
An appropriate, descriptive label is assigned to each variable in the data set. Original signal labels (from `features.txt`) are amended to remove parenthesis and give an improved description, in particular:

* `t` at the start of the label is replaced with `time`,
* `f` at the start of the label is replaced with ` frequency`,
* `Acc` is replaced with `Accelerometer`,
* `Gyro` is replaced with `Gyroscope`,
* `Mag` is replaced with `Magnitude`, 
* `BodyBody` is replaced with `Body`,
* `mean()` is replaced with `mean`, and
* `std()` is replaced with `standardDeviation`.

__Producing a tidy data set__
A tidy data set is created from the intermediate data set, where the average of each signal variable is calculated for each activity and subject.

# Tidy Data Set

The final tidy data set contains the following variables:

* an ID of the subject who performed the activity (__subject__), in the range from 1 to 30. 
* an activity label (__activity__), either WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING.
* average mean value and standard deviation of each measurement collected from the accelerometer and gyroscope 3-axial raw signals. These numerical variables are bounded within [-1,1] and their names are:
__timeBodyAccelerometer-mean-X,
timeBodyAccelerometer-mean-Y,
timeBodyAccelerometer-mean-Z,
timeBodyAccelerometer-standardDeviation-X,
timeBodyAccelerometer-standardDeviation-Y,
timeBodyAccelerometer-standardDeviation-Z,
timeGravityAccelerometer-mean-X,
timeGravityAccelerometer-mean-Y,
timeGravityAccelerometer-mean-Z,
timeGravityAccelerometer-standardDeviation-X,
timeGravityAccelerometer-standardDeviation-Y,
timeGravityAccelerometer-standardDeviation-Z,
timeBodyAccelerometerJerk-mean-X,
timeBodyAccelerometerJerk-mean-Y,
timeBodyAccelerometerJerk-mean-Z,
timeBodyAccelerometerJerk-standardDeviation-X,
timeBodyAccelerometerJerk-standardDeviation-Y,
timeBodyAccelerometerJerk-standardDeviation-Z,
timeBodyGyroscope-mean-X,
timeBodyGyroscope-mean-Y,
timeBodyGyroscope-mean-Z,
timeBodyGyroscope-standardDeviation-X,
timeBodyGyroscope-standardDeviation-Y,
timeBodyGyroscope-standardDeviation-Z,
timeBodyGyroscopeJerk-mean-X,
timeBodyGyroscopeJerk-mean-Y,
timeBodyGyroscopeJerk-mean-Z,
timeBodyGyroscopeJerk-standardDeviation-X,
timeBodyGyroscopeJerk-standardDeviation-Y,
timeBodyGyroscopeJerk-standardDeviation-Z,
timeBodyAccelerometerMagnitude-mean,
timeBodyAccelerometerMagnitude-standardDeviation,
timeGravityAccelerometerMagnitude-mean,
timeGravityAccelerometerMagnitude-standardDeviation,
timeBodyAccelerometerJerkMagnitude-mean,
timeBodyAccelerometerJerkMagnitude-standardDeviation,
timeBodyGyroscopeMagnitude-mean,
timeBodyGyroscopeMagnitude-standardDeviation,
timeBodyGyroscopeJerkMagnitude-mean,
timeBodyGyroscopeJerkMagnitude-standardDeviation,
frequencyBodyAccelerometer-mean-X,
frequencyBodyAccelerometer-mean-Y,
frequencyBodyAccelerometer-mean-Z,
frequencyBodyAccelerometer-standardDeviation-X,
frequencyBodyAccelerometer-standardDeviation-Y,
frequencyBodyAccelerometer-standardDeviation-Z,
frequencyBodyAccelerometerJerk-mean-X,
frequencyBodyAccelerometerJerk-mean-Y,
frequencyBodyAccelerometerJerk-mean-Z,
frequencyBodyAccelerometerJerk-standardDeviation-X,
frequencyBodyAccelerometerJerk-standardDeviation-Y,
frequencyBodyAccelerometerJerk-standardDeviation-Z,
frequencyBodyGyroscope-mean-X,
frequencyBodyGyroscope-mean-Y,
frequencyBodyGyroscope-mean-Z,
frequencyBodyGyroscope-standardDeviation-X,
frequencyBodyGyroscope-standardDeviation-Y,
frequencyBodyGyroscope-standardDeviation-Z,
frequencyBodyAccelerometerMagnitude-mean,
frequencyBodyAccelerometerMagnitude-standardDeviation,
frequencyBodyAccelerometerJerkMagnitude-mean,
frequencyBodyAccelerometerJerkMagnitude-standardDeviation,
frequencyBodyGyroscopeMagnitude-mean,
frequencyBodyGyroscopeMagnitude-standardDeviation,
frequencyBodyGyroscopeJerkMagnitude-mean,__
and 
__frequencyBodyGyroscopeJerkMagnitude-standardDeviation__.

