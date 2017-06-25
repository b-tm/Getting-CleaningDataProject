## downloading the file from source 

if(!file.exists("./Data")) dir.create("./Data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/UciHarData.zip")

## unziping data
unzip <- unzip("./data/UciHarData.zip", exdir = "./Data")

## loading data into R
xTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subjTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
xTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
Features <- read.table("./data/UCI HAR Dataset/features.txt")

## Looking at the properties of variables
str(yTest)
str(yTrain)
str(subjTrain)
str(subjTest)
str(xTest)
str(xTrain)

## 1. Merge Test and Train for creating a new data set, checking for duplicates, cleaning the duplicates
Test<- cbind(subjTest, yTest, xTest)
Train <- cbind(subjTrain, yTrain, xTrain)
allData <- rbind(Test, Train)
duplicated(colnames(allData))
allData <- allData[, !duplicated(colnames(allData))]

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## Loading data ito R
Features <- read.table("./data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[,2]
FeaturesIndex <- grep(("mean\\(\\)|std\\(\\)"), Features)
final_Data <- allData[, c(1, 2, FeaturesIndex+2)]
colnames(final_Data) <- c("subject", "activity", Features[FeaturesIndex])

## 3. Uses descriptive activity names to name the activities in the data set
activitiesLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
names(activitiesLabels) <- c('act_id', 'act_name')
final_Data$activity <- factor(final_Data$activity, levels = activitiesLabels[,1], labels = activitiesLabels[,2])

## 4. Appropriately labels the data set with descriptive variable names.
names(final_Data) <- gsub("\\()", "", names(final_Data))
names(final_Data) <- gsub("Mag", "Magnitude", names(final_Data))
names(final_Data) <- gsub("Acc", "Accelerator", names(final_Data))
names(final_Data) <- gsub("^t", "time", names(final_Data))
names(final_Data) <- gsub("^f", "frequence", names(final_Data))
names(final_Data) <- gsub("Gyro", "Gyroscope", names(final_Data))
names(final_Data) <- gsub("-mean", "Mean", names(final_Data))
names(final_Data) <- gsub("-std", "Std", names(final_Data))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
library(plyr)
names(final_Data)
data<-aggregate(. ~subject + activity, final_Data, mean)
data<-data[order(data$subject,data$activity),]
write.table(data, file = "tidydata.txt",row.name=FALSE)
