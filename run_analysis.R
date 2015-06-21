library(plyr)

# downloading and unziping data
if(!(file.exists("UCI HAR Dataset"))) {
  zip_file <- "data_files.zip"
  if(!file.exists(zip_file)) {
    zip_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url=zip_URL, destfile = zip_file, method="curl")
  }  
  unzip(zip_file) 
}
setwd("./UCI HAR Dataset")

# 1: Merging the training and the test sets to create one data set.
# loading train and test data sets
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# merging train and test data sets
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)

# 2: Extracting only the measurements on the mean and standard deviation for each measurement. 
# loading features information
features <- read.table("./features.txt")
# selecting only mean and standard deviation for each measurement
mean_std_meas <- features[grep('mean\\(\\)|std\\(\\)', features[,2]), ]
x_all <- x_all[, mean_std_meas[,1]]

# 3: Using descriptive activity names to name the activities in the data set
activities <- read.table("./activity_labels.txt")
y_all[,1] <- activities[y_all[,1], 2]
names(y_all) <- "activity"

# 4: Appropriately labeling the data set with descriptive variable names
names(subject_all) <- "subject"
# changing column names so that they are more meaningful
names(x_all) <- mean_std_meas[,2]  
names(x_all) <- gsub("^t", "time", names(x_all))
names(x_all) <- gsub("^f", "frequency", names(x_all))
names(x_all) <- gsub("Acc", "Accelerometer", names(x_all))
names(x_all) <- gsub("Gyro", "Gyroscope", names(x_all))
names(x_all) <- gsub("Mag", "Magnitude", names(x_all))
names(x_all) <- gsub("BodyBody", "Body", names(x_all))
names(x_all) <- gsub("mean\\(\\)", "mean", names(x_all))
names(x_all) <- gsub("std\\(\\)", "standardDeviation", names(x_all))

# creating a data set with the whole information
complete_all <- cbind(subject_all, y_all, x_all)

# 5: Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
ave_all <- ddply(complete_all, .(subject,activity), numcolwise(mean))

setwd("..")
write.table(ave_all, file = "./tidy_data.txt", row.name = FALSE, quote = FALSE)  # dumping tidy data set into a text file
