Getting and Cleaning Data Course Project
==========================================

# Project Overview

This repo contains the R code and the documentation files for the Coursera course [Getting and Cleaning Data](https://www.coursera.org/course/getdata). The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

# Raw Data

The data for the project is from the Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors. 

The dataset is located here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data set is available at: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Project Tasks

The aim is to create one R script called `run_analysis.R` that does the following:
 
1.	Merges the training and the test sets to create one data set.

2.	Extracts only the measurements on the mean and standard deviation for each measurement. 


3.	Uses descriptive activity names to name the activities in the data set.

4.	Appropriately labels the data set with descriptive variable names. 


5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Repo Content

* `CodeBook.md`: describes the variables, the data, and the aforementioned transformations to prepare the processed, tidy data set.

* `run_analysis.R`: contains the R script to transform the raw into the tidy data set. Save this file into your working directory and run the script in an R console using the command `source("run_analysis.R")`. The script generates an output file called ` tidy_data.txt`. Note that it requires the prior installation of the package `plyr`.

