# CodeBook 

This code book summarizes the data and variables in Final_Tidy_Data.txt. This data frame is composed of 180 observations and 88 variables. For each of the 6 subjects participating in this study, there are total of 30 observations.

### Dataset Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Project Dataset:
[Getting_Data_Project.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

For each record in the dataset it is provided: 
  * Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
  * Triaxial Angular velocity from the gyroscope. 
  * A 561-feature vector with time and frequency domain variables. 
  * Its activity label. 
  * An identifier of the subject who carried out the experiment.
 
  A full description of the raw data can be found here:      http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### run_analysis.R Steps and Variables:

1. Checks if the "UCI HAR Dataset" directory exists. If not, checks to see if the zip file is in the directory, if not, then downloads the zip file. The zip file is then unzipped and the zipfile is then removed from the working directory.
    * zipURL: URL for the zip file (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
    * rawzipfile: name of the zip file (Getting_Data_Project.zip)

2. Read the text files withing the "UCI HAR Dataset" directory   
    * activites_labels: 6 exercise types (LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS)
    * features: 561 measurement types  (e.g. tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z)
    * subject_DF: Merged dataframe for subject_test and subject_train dataframes
    * subject_test: Subject ID for the test dataset
    * subject_train: Subject ID for the train dataset
    * x_test: X test measurement data 
    * x_train X train measurement data
    * y_test: Y test measurement data
    * y_train: Y train measurement data
  
3. Merge test and train dataframes for X, Y and Subject using rbind()
    * x_DF: Merged dataframe for x_test and x_train dataframes
    * y_DF: Merged dataframe for y_test and y_train dataframes
    * subject_DF: Merged dataframe for subject_test and subject_train dataframes

4. Merge X, Y and Subject dataframes into a single dataframe using cbind()  
    * total_DF: A single dataframe with X, Y and Subject dataframes
5. Use select() and contains() to select mean and standard deviation (std) measurement columns 
    * selected_DF: Dataframe containing the select mean and standard deviation (std) measurement columns, Subject and Activity_ID
6. Change the Acticity_ID to the descriptive activity type and relabel column headers to be more descriptive using gsub() and names() functions
7. Create a new tidy dataframe with groups based on Subject and Activity_ID. Summarize by averaging each column by the Subject and Activity_ID groups. Use group_by() function.
    * Tidy_DF: A new tidy dataframe with groups based on Subject and Activity_ID, summarized by averaging each column by the Subject and   Activity_ID groups
8. Create final tidy data text file

## Final_Tidy_Data Outputs:

1. Subject: Numeric identifier of the subject who performed the various activities.
2. Activity_ID: Activity identifier (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The following numeric varaibles (3-88) measure the mean or standard deviation of the triaxial acceleration from the accelerometer (total acceleration), the estimated body acceleration and the triaxial angular velocity from the gyroscope.

Note: The acceleration measurements from the smartphone accelerometer are measured in standard gravity units 'g'. The body acceleration signal obtained by subtracting the gravity from the total acceleration. The angular velocity vector measured by the gyroscope have units of radians/second.

3.  TimeBodyAccelerometer.Mean...X
4.  TimeBodyAccelerometer.Mean...Y
5.  TimeBodyAccelerometer.Mean...Z
6.  TimeGravityAccelerometer.Mean...X
7.  TimeGravityAccelerometer.Mean...Y
8.  TimeGravityAccelerometer.Mean...Z
9.  TimeBodyAccelerometerJerk.Mean...X
10. TimeBodyAccelerometerJerk.Mean...Y
11. TimeBodyAccelerometerJerk.Mean...Z
12. TimeBodyGyroscope.Mean...X
13. TimeBodyGyroscope.Mean...Y
14. TimeBodyGyroscope.Mean...Z
15. TimeBodyGyroscopeJerk.Mean...X
16. TimeBodyGyroscopeJerk.Mean...Y
17. TimeBodyGyroscopeJerk.Mean...Z
18. TimeBodyAccelerometerMagnitude.Mean..
19. TimeGravityAccelerometerMagnitude.Mean..
20. TimeBodyAccelerometerJerkMagnitude.Mean..
21. TimeBodyGyroscopeMagnitude.Mean..
22. TimeBodyGyroscopeJerkMagnitude.Mean..
23. FrequencyuencyBodyAccelerometer.Mean...X
24. FrequencyuencyBodyAccelerometer.Mean...Y
25. FrequencyuencyBodyAccelerometer.Mean...Z
26. FrequencyuencyBodyAccelerometer.MeanFrequency...X
27. FrequencyuencyBodyAccelerometer.MeanFrequency...Y
28. FrequencyuencyBodyAccelerometer.MeanFrequency...Z
29. FrequencyuencyBodyAccelerometerJerk.Mean...X
30. FrequencyuencyBodyAccelerometerJerk.Mean...Y
31. FrequencyuencyBodyAccelerometerJerk.Mean...Z
32. FrequencyuencyBodyAccelerometerJerk.MeanFrequency...X
33. FrequencyuencyBodyAccelerometerJerk.MeanFrequency...Y
34. FrequencyuencyBodyAccelerometerJerk.MeanFrequency...Z
35. FrequencyuencyBodyGyroscope.Mean...X
36. FrequencyuencyBodyGyroscope.Mean...Y
37. FrequencyuencyBodyGyroscope.Mean...Z
38. FrequencyuencyBodyGyroscope.MeanFrequency...X
39. FrequencyuencyBodyGyroscope.MeanFrequency...Y
40. FrequencyuencyBodyGyroscope.MeanFrequency...Z
41. FrequencyuencyBodyAccelerometerMagnitude.Mean..
42. FrequencyuencyBodyAccelerometerMagnitude.MeanFrequency..
43. FrequencyuencyBodyAccelerometerJerkMagnitude.Mean..
44. FrequencyuencyBodyAccelerometerJerkMagnitude.MeanFrequency..
45. FrequencyuencyBodyGyroscopeMagnitude.Mean..
46. FrequencyuencyBodyGyroscopeMagnitude.MeanFrequency..
47. FrequencyuencyBodyGyroscopeJerkMagnitude.Mean..
48. FrequencyuencyBodyGyroscopeJerkMagnitude.MeanFrequency..
49. Angle.TimeBodyAccelerometerMean.Gravity.
50. Angle.TimeBodyAccelerometerJerkMean..GravityMean.
51. Angle.TimeBodyGyroscopeMean.GravityMean.
52. Angle.TimeBodyGyroscopeJerkMean.GravityMean.
53. Angle.X.GravityMean.
54. Angle.Y.GravityMean.
55. Angle.Z.GravityMean.
56. TimeBodyAccelerometer.STD...X
57. TimeBodyAccelerometer.STD...Y
58. TimeBodyAccelerometer.STD...Z
59. TimeGravityAccelerometer.STD...X
60. TimeGravityAccelerometer.STD...Y
61. TimeGravityAccelerometer.STD...Z
62. TimeBodyAccelerometerJerk.STD...X
63. TimeBodyAccelerometerJerk.STD...Y
64. TimeBodyAccelerometerJerk.STD...Z
65. TimeBodyGyroscope.STD...X
66. TimeBodyGyroscope.STD...Y
67. TimeBodyGyroscope.STD...Z
68. TimeBodyGyroscopeJerk.STD...X
69. TimeBodyGyroscopeJerk.STD...Y
70. TimeBodyGyroscopeJerk.STD...Z
71. TimeBodyAccelerometerMagnitude.STD..
72. TimeGravityAccelerometerMagnitude.STD..
73. TimeBodyAccelerometerJerkMagnitude.STD..
74. TimeBodyGyroscopeMagnitude.STD..
75. TimeBodyGyroscopeJerkMagnitude.STD..
76. FrequencyuencyBodyAccelerometer.STD...X
77. FrequencyuencyBodyAccelerometer.STD...Y
78. FrequencyuencyBodyAccelerometer.STD...Z
79. FrequencyuencyBodyAccelerometerJerk.STD...X
80. FrequencyuencyBodyAccelerometerJerk.STD...Y
81. FrequencyuencyBodyAccelerometerJerk.STD...Z
82. FrequencyuencyBodyGyroscope.STD...X
83. FrequencyuencyBodyGyroscope.STD...Y
84. FrequencyuencyBodyGyroscope.STD...Z
85. FrequencyuencyBodyAccelerometerMagnitude.STD..
86. FrequencyuencyBodyAccelerometerJerkMagnitude.STD..
87. FrequencyuencyBodyGyroscopeMagnitude.STD..
88. FrequencyuencyBodyGyroscopeJerkMagnitude.STD..

