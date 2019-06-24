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

3. TimeBodyAccelerometer.mean...X                    
4. TimeBodyAccelerometer.mean...Y
5. TimeBodyAccelerometer.mean...Z
6. TimeGravityAccelerometer.mean...X
7. TimeGravityAccelerometer.mean...Y
8. TimeGravityAccelerometer.mean...Z
9. TimeBodyAccelerometerJerk.mean...X
10. TimeBodyAccelerometerJerk.mean...Y
11. TimeBodyAccelerometerJerk.mean...Z
12. TimeBodyGyroscope.mean...X
13. TimeBodyGyroscope.mean...Y
14. TimeBodyGyroscope.mean...Z
15. TimeBodyGyroscopeJerk.mean...X
16. TimeBodyGyroscopeJerk.mean...Y
17. TimeBodyGyroscopeJerk.mean...Z
18. TimeBodyAccelerometerMagnitude.mean..
19. TimeGravityAccelerometerMagnitude.mean..
20. TimeBodyAccelerometerJerkMagnitude.mean..
21. TimeBodyGyroscopeMagnitude.mean..
22. TimeBodyGyroscopeJerkMagnitude.mean..
23. FrequencyBodyAccelerometer.mean...X
24. FrequencyBodyAccelerometer.mean...Y
25. FrequencyBodyAccelerometer.mean...Z
26. FrequencyBodyAccelerometer.meanFreq...X
27. FrequencyBodyAccelerometer.meanFreq...Y           
28. FrequencyBodyAccelerometer.meanFreq...Z
29. FrequencyBodyAccelerometerJerk.mean...X
30. FrequencyBodyAccelerometerJerk.mean...Y
31. FrequencyBodyAccelerometerJerk.mean...Z
32. FrequencyBodyAccelerometerJerk.meanFreq...X
33. FrequencyBodyAccelerometerJerk.meanFreq...Y
34. FrequencyBodyAccelerometerJerk.meanFreq...Z
35. FrequencyBodyGyroscope.mean...X
36. FrequencyBodyGyroscope.mean...Y                   
37. FrequencyBodyGyroscope.mean...Z
38. FrequencyBodyGyroscope.meanFreq...Z
39. FrequencyBodyAccelerometerJerkMagnitude.mean..
40. FrequencyBodyGyroscopeMagnitude.meanFreq..
41. Angle.TimeBodyAccelerometerMean.Gravity.
42. Angle.TimeBodyGyroscopeJerkMean.GravityMean.
43. Angle.Z.GravityMean.
44. TimeBodyAccelerometer.std...Z
45. TimeGravityAccelerometer.std...Z
46. TimeBodyAccelerometerJerk.std...Z
47. TimeBodyGyroscope.std...Z
48. TimeBodyGyroscopeJerk.std...Z
49. TimeBodyAccelerometerJerkMagnitude.std..
50. FrequencyBodyAccelerometer.std...X
51. FrequencyBodyAccelerometerJerk.std...X
52. FrequencyBodyGyroscope.std...X
53. FrequencyBodyAccelerometerMagnitude.std..
54. FrequencyBodyGyroscopeJerkMagnitude.std..
55. FrequencyBodyGyroscope.meanFreq...X
56. FrequencyBodyAccelerometerMagnitude.mean..
57. FrequencyBodyAccelerometerJerkMagnitude.meanFreq..
58. FrequencyBodyGyroscopeJerkMagnitude.mean..
59. Angle.TimeBodyAccelerometerJerkMean..GravityMean.
60. Angle.X.GravityMean.
61. TimeBodyAccelerometer.std...X
62. TimeGravityAccelerometer.std...X
63. TimeBodyAccelerometerJerk.std...X
64. TimeBodyGyroscope.std...X
65. TimeBodyGyroscopeJerk.std...X
66. TimeBodyAccelerometerMagnitude.std..
67. TimeBodyGyroscopeMagnitude.std..
68. FrequencyBodyAccelerometer.std...Y
69. FrequencyBodyAccelerometerJerk.std...Y
70. FrequencyBodyGyroscope.std...Y
71. FrequencyBodyAccelerometerJerkMagnitude.std..
72. FrequencyBodyGyroscope.meanFreq...Y
73. FrequencyBodyAccelerometerMagnitude.meanFreq..
74. FrequencyBodyGyroscopeMagnitude.mean..
75. FrequencyBodyGyroscopeJerkMagnitude.meanFreq..
76. Angle.TimeBodyGyroscopeMean.GravityMean.
77. Angle.Y.GravityMean.
78. TimeBodyAccelerometer.std...Y
79. TimeGravityAccelerometer.std...Y
80. TimeBodyAccelerometerJerk.std...Y
81. TimeBodyGyroscope.std...Y
82. TimeBodyGyroscopeJerk.std...Y
83. TimeGravityAccelerometerMagnitude.std..
84. TimeBodyGyroscopeJerkMagnitude.std..
85. FrequencyBodyAccelerometer.std...Z
86. FrequencyBodyAccelerometerJerk.std...Z
87. FrequencyBodyGyroscope.std...Z
88. FrequencyBodyGyroscopeMagnitude.std..
