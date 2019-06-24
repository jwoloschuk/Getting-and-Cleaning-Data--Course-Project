# Getting and Cleaning Data: Course Project
# The purpose of this project is to demonstrate my ability to collect, 
# work with, and clean a data set.

# run_analysis.R will download and convert the untidy dataset into a 
# tidy and clean dataset. This is acomplished in a number of steps:

# Loads dplyr package (we will be using the "select", "contains", "group_by", "summarize_all" functions)
# Assumes dplyr is already installed

library(dplyr)

# Set working directory, save the zip file URL, and the zip file name

setwd("C:/Users/jordan.woloschuk/Documents/GitHub/Getting_and_Cleaning_Data-Course_Project")

zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

rawzipfile <- "Getting_Data_Project.zip"


# Checks if the "UCI HAR Dataset" directory exists. If not, checks to see if the
# zip file is in the directory, if not, then downloads the zip file. The zip file
# is then unzipped and the zipfile is then removed from the working directory.

if (!file.exists("UCI HAR Dataset")){
        if (!file.exists(rawzipfile)) {
                download.file(zipURL, rawzipfile, method = "curl")
        }
            
        unzip(rawzipfile)
        file.remove(rawzipfile)
}

# Set working directory inside "UCI HAR Dataset" directory and read text files 

setwd("C:/Users/jordan.woloschuk/Documents/GitHub/Getting_and_Cleaning_Data-Course_Project/UCI HAR Dataset")

features <- read.table("features.txt", col.names = c("count","functions"))
activites_labels <- read.table("activity_labels.txt", col.names = c("Activity_ID", "activity_type"))

# Set working directory inside "test" directory and read text files
# For "x_test.txt" we are setting the column names equal to the functions listed
# in the features dataframe

setwd("C:/Users/jordan.woloschuk/Documents/GitHub/Getting_and_Cleaning_Data-Course_Project/UCI HAR Dataset/test")

subject_test <- read.table("subject_test.txt", col.names = "Subject")
x_test <- read.table("X_test.txt", col.names = features$functions)
y_test <- read.table("y_test.txt", col.names = "Activity_ID")

# Set working directory inside "train" directory and read text files
# For "x_train.txt" we are setting the column names equal to the functions listed
# in the features dataframe

setwd("C:/Users/jordan.woloschuk/Documents/GitHub/Getting_and_Cleaning_Data-Course_Project/UCI HAR Dataset/train")

subject_train <- read.table("subject_train.txt", col.names = "Subject")
x_train <- read.table("X_train.txt", col.names = features$functions)
y_train <- read.table("y_train.txt", col.names = "Activity_ID")

# Merge test and train dataframes for X, Y and Subject

x_DF <- rbind(x_train, x_test)
y_DF <- rbind(y_train,y_test)
subject_DF <- rbind(subject_train, subject_test)

# Combine X, Y and Subject dataframes into a single dataframe

total_DF <- cbind(subject_DF,x_DF,y_DF)

# Select mean and standard deviation (std) measurement columns

selected_DF <- total_DF %>% select(Subject, Activity_ID, contains("mean"), contains("std"))

# Change the Acticity ID to the descriptive activity type
selected_DF$Activity_ID <- activites_labels[selected_DF$Activity_ID,2]

# Relabel column headers to be more descriptive using gsub() function

# Replace "t" at the start with Time
names(selected_DF) <- gsub("^t", "Time",names(selected_DF))
# Replace "f" at the start with frequency
names(selected_DF) <- gsub("^f", "Frequency", names(selected_DF))
names(selected_DF) <- gsub("Gyro", "Gyroscope", names(selected_DF))
names(selected_DF) <- gsub("BodyBody", "Body",names(selected_DF))
names(selected_DF) <- gsub("Acc", "Accelerometer",names(selected_DF))
names(selected_DF) <- gsub("Mag", "Magnitude",names(selected_DF))
names(selected_DF) <- gsub("t[bB]ody", "TimeBody",names(selected_DF))
names(selected_DF) <- gsub("gravity", "Gravity",names(selected_DF))
names(selected_DF) <- gsub("angle", "Angle",names(selected_DF))
names(selected_DF) <- gsub("-mean()", "Mean", names(selected_DF), ignore.case = TRUE)
names(selected_DF) <- gsub("-std()", "STD", names(selected_DF), ignore.case = TRUE)
names(selected_DF) <- gsub("-freq()", "Frequency", names(selected_DF), ignore.case = TRUE)

# Create a new tidy dataframe with groups based on Subject and Activity_ID

Tidy_DF <- selected_DF %>% 
        
        group_by(Subject, Activity_ID) %>% 

# Summarize by averaging each column by the Subject and Activity_ID groups                
        
        summarize_all(list(mean))


# Move up two directories and create final tidy data text file (180 observations and 88 variables)

setwd("../..")
write.table(Tidy_DF, "Final_Tidy_Data.txt", row.names = FALSE)



