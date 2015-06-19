# Cleaning Data Project

# read in the text files for training and test data
#body_acc_x_test <- read.table("UCI Har Dataset/test/Inertial Signals/body_acc_x_test.txt")
#body_acc_y_test <- read.table("UCI Har Dataset/test/Inertial Signals/body_acc_y_test.txt")
#body_acc_z_test <- read.table("UCI Har Dataset/test/Inertial Signals/body_acc_z_test.txt")
#body_gyro_x_test <- read.table("UCI Har Dataset/test/Inertial Signals/body_gyro_x_test.txt")
#body_gyro_y_test <- read.table("UCI Har Dataset/test/Inertial Signals/body_gyro_y_test.txt")
#body_gyro_z_test <- read.table("UCI Har Dataset/test/Inertial Signals/body_gyro_z_test.txt")
#total_acc_x_test <- read.table("UCI Har Dataset/test/Inertial Signals/total_acc_x_test.txt")
#total_acc_y_test <- read.table("UCI Har Dataset/test/Inertial Signals/total_acc_x_test.txt")
#total_acc_z_test <- read.table("UCI Har Dataset/test/Inertial Signals/total_acc_x_test.txt")
subject_test <- read.table("UCI Har Dataset/test/subject_test.txt")
X_test <- read.table("UCI Har Dataset/test/X_test.txt")
y_test <- read.table("UCI Har Dataset/test/y_test.txt")

#body_acc_x_train <- read.table("UCI Har Dataset/train/Inertial Signals/body_acc_x_train.txt")
#body_acc_y_train <- read.table("UCI Har Dataset/train/Inertial Signals/body_acc_y_train.txt")
#body_acc_z_train <- read.table("UCI Har Dataset/train/Inertial Signals/body_acc_z_train.txt")
#body_gyro_x_train <- read.table("UCI Har Dataset/train/Inertial Signals/body_gyro_x_train.txt")
#body_gyro_y_train <- read.table("UCI Har Dataset/train/Inertial Signals/body_gyro_y_train.txt")
#body_gyro_z_train <- read.table("UCI Har Dataset/train/Inertial Signals/body_gyro_z_train.txt")
#total_acc_x_train <- read.table("UCI Har Dataset/train/Inertial Signals/total_acc_x_train.txt")
#total_acc_y_train <- read.table("UCI Har Dataset/train/Inertial Signals/total_acc_x_train.txt")
#total_acc_z_train <- read.table("UCI Har Dataset/train/Inertial Signals/total_acc_x_train.txt")
subject_train <- read.table("UCI Har Dataset/train/subject_train.txt")
X_train <- read.table("UCI Har Dataset/train/X_train.txt")
y_train <- read.table("UCI Har Dataset/train/y_train.txt")


# importing feature names
featurenames <- read.table("UCI Har Dataset/features.txt")
colnames(X_train) <- featurenames[,2]
colnames(X_test) <- featurenames[,2]

# renaming column in subject data
colnames(subject_train) <- "subject"
colnames(subject_test) <- "subject"

# renameing column in activity data
colnames(y_train) <- "activity"
colnames(y_test) <- "activity"


#dim(subject_test)
#dim(X_test)
#dim(y_test)

# creating a dataframe for test data
test <- data.frame(subject_test, X_test, y_test)

# creating a dataframe for train data
train <- data.frame(subject_train, X_train, y_train)

# creating a marker for which dataset the data came from
test$set <- "test"
train$set <- "train"

# merge the two datasets
alldata <- rbind(test,train)


# extracting only the measurements on the mean and standard deviation for each measurement
alldata.mean.sd <- alldata[,c("subject", "activity", "set", "tBodyAcc.mean...X", "tBodyAcc.mean...Y", "tBodyAcc.mean...Z", "tBodyAcc.std...X", "tBodyAcc.std...Y", "tBodyAcc.std...Z", "tGravityAcc.mean...X", "tGravityAcc.mean...Y", "tGravityAcc.mean...Z", "tGravityAcc.std...X", "tGravityAcc.std...Y", "tGravityAcc.std...Z", "tBodyAccJerk.mean...X", "tBodyAccJerk.mean...Y", "tBodyAccJerk.mean...Z", "tBodyAccJerk.std...X", "tBodyAccJerk.std...Y", "tBodyAccJerk.std...Z", "tBodyGyro.mean...X", "tBodyGyro.mean...Y", "tBodyGyro.mean...Z", "tBodyGyro.std...X", "tBodyGyro.std...Y", "tBodyGyro.std...Z", "tBodyGyroJerk.mean...X", "tBodyGyroJerk.mean...Y", "tBodyGyroJerk.mean...Z", "tBodyGyroJerk.std...X", "tBodyGyroJerk.std...Y", "tBodyGyroJerk.std...Z", "tBodyAccMag.mean..", "tBodyAccMag.std..", "tGravityAccMag.mean..", "tGravityAccMag.std..", "tBodyAccJerkMag.mean..", "tBodyAccJerkMag.std..", "tBodyGyroMag.mean..", "tBodyGyroMag.std..", "tBodyGyroJerkMag.mean..", "tBodyGyroJerkMag.std..", "fBodyAcc.mean...X", "fBodyAcc.mean...Y", "fBodyAcc.mean...Z", "fBodyAcc.std...X", "fBodyAcc.std...Y", "fBodyAcc.std...Z", "fBodyAcc.meanFreq...X", "fBodyAcc.meanFreq...Y", "fBodyAcc.meanFreq...Z", "fBodyAccJerk.mean...X", "fBodyAccJerk.mean...Y", "fBodyAccJerk.mean...Z", "fBodyAccJerk.std...X", "fBodyAccJerk.std...Y", "fBodyAccJerk.std...Z", "fBodyAccJerk.meanFreq...X", "fBodyAccJerk.meanFreq...Y", "fBodyAccJerk.meanFreq...Z", "fBodyGyro.mean...X", "fBodyGyro.mean...Y", "fBodyGyro.mean...Z", "fBodyGyro.std...X", "fBodyGyro.std...Y", "fBodyGyro.std...Z", "fBodyGyro.meanFreq...X", "fBodyGyro.meanFreq...Y", "fBodyGyro.meanFreq...Z", "fBodyAccMag.mean..", "fBodyAccMag.std..", "fBodyAccMag.meanFreq..", "fBodyBodyAccJerkMag.mean..", "fBodyBodyAccJerkMag.std..", "fBodyBodyAccJerkMag.meanFreq..", "fBodyBodyGyroMag.mean..", "fBodyBodyGyroMag.std..", "fBodyBodyGyroMag.meanFreq..", "fBodyBodyGyroJerkMag.mean..", "fBodyBodyGyroJerkMag.std..", "fBodyBodyGyroJerkMag.meanFreq..")]



# create a variable for activity name
library(plyr)
alldata.mean.sd$activity_name[alldata.mean.sd$activity == "1"] <- "WALKING"
alldata.mean.sd$activity_name[alldata.mean.sd$activity == "2"] <- "WALKING_UPSTAIRS"
alldata.mean.sd$activity_name[alldata.mean.sd$activity == "3"] <- "WALKING_DOWNSTAIRS"
alldata.mean.sd$activity_name[alldata.mean.sd$activity == "4"] <- "SITTING"
alldata.mean.sd$activity_name[alldata.mean.sd$activity == "5"] <- "STANDING"
alldata.mean.sd$activity_name[alldata.mean.sd$activity == "6"] <- "LAYING"

#head(alldata.mean.sd)

# finding means for each variable by activity and subject
act.sub.mean <- aggregate(alldata.mean.sd[,1:83], by=list(alldata.mean.sd$activity_name, alldata.mean.sd$subject), mean, na.rm=TRUE)
act.sub.mean

# writing datasets to text files

#write.table(alldata.mean.sd, file="tidydata1.txt", row.name=FALSE)
#write.table(act.sub.mean, file="tidydata2.txt", row.name=FALSE)

