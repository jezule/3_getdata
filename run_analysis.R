# This script has been developed in a Windows machine. For a different architecture it may be necessary
# to a method in download.file (typically, method='curl') for this to work.
library(plyr)

clean.data = function() {
    # 0. Download data.
	# Check if a directory called data exists, create it otherwise.
    if (!file.exists("data")) {
        dir.create("data")
    }
	# If the directory data does not contain the dataset, then download & extract.
    if (!file.exists("data/UCI HAR Dataset")) {
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        zipfile="data/UCI_HAR_data.zip"
        download.file(fileURL, destfile=zipfile)
        unzip(zipfile, exdir="data")
    }

    # 1. Merge the training and the test sets to create one data set.
	# Training data.
    training.x <- read.table("data/UCI HAR Dataset/train/X_train.txt")
    training.y <- read.table("data/UCI HAR Dataset/train/y_train.txt")
    training.subject <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
	# Test data.
    test.x <- read.table("data/UCI HAR Dataset/test/X_test.txt")
    test.y <- read.table("data/UCI HAR Dataset/test/y_test.txt")
    test.subject <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
    # Merge both.
    merged.x <- rbind(training.x, test.x)
    merged.y <- rbind(training.y, test.y)
    merged.subject <- rbind(training.subject, test.subject)
    # Single data set.
    merged <- list(x=merged.x, y=merged.y, subject=merged.subject)

    # 2. Extract only the measurements on the mean and standard deviation for 
	# each measurement. 
    features <- read.table("data/UCI HAR Dataset/features.txt")
	# Get the indices of the columns with either mean() or std() in their names.
	mean_or_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
    # Subset the data.
	merged.x <- merged.x[, mean_or_std_features]
	# Name the columns.
	colnames(merged.x) <- features[mean_or_std_features, 2]
	
    # 3. Use descriptive activity names to name the activities in the data set
	activities <- read.table("data/UCI HAR Dataset/activity_labels.txt")
	# Update the numeric values with full activity names.
	merged.y[, 1] <- activities[merged.y[, 1], 2]
	# Change column name.
	colnames(merged.y) <- "activity"
	
	# 4. Appropriately labels the data set with descriptive variable names. 
	colnames(merged.subject) <- c("subject")
	merged2 = cbind(merged.x, merged.y, merged.subject)
	
	# From the data set in step 4, creates a second, independent tidy data set with the 
	# average of each variable for each activity and each subject.
	tidy <- ddply(merged2, .(subject, activity), function(x) colMeans(x[,1:66]))
    # Use write.table() [using row.name=FALSE] to save the data set as a txt file.
	write.table(tidy, "tidy.txt", row.name=FALSE)
}
