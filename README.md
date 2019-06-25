# Getting and Cleaning Data: Course Project

### Dataset Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Project Dataset:
[Getting_Data_Project.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Files:

#### run_analysis.R
Script collects, work with, and clean a data set by:
  1. Merging the training and the test sets to create one data set.
  2. Extracting only the mean and standard deviation measurements (86 unique measurements).
  3. Updates the descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. Finally creates an independent tidy data set / text file with the average of each variable for each activity and for the 30 subjects.

#### CodeBook.md
Describes the variables, the data, and any process to clean up the data

#### Final_Tidy_Data.txt
The exported final data text file produced from the run_analysis.R script. This file contains 180 observations (30 subjects, each with 6 activity types) and a total of 88 variables (Subject identifier, activity identifier and 86 unique mean and standard deviation measurements)
