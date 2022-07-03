#Load dplyr packages

library(dplyr)

## UCI HAR Dataset downloaded and opened in the R Studio. A new project folder "dplyr project" created 
## and DataSet was opened in R Studio

## features, activities and subject_test txt files were read and columns were renamed using col.names

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

## The X-test, y_test, subject_test txt were read and new column names assigned


subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject_ID"))
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = c(features$functions))
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code") 

## The X-train, y_train, subject_train txt were read and new column names assigned

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject_ID"))
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = c(features$functions))
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

## Merge test and training data sets
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)
Mergeddata <- rbind.data.frame(test, train)

## Extracting columns containing mean and Std 
Tidydata <- Mergeddata %>%
                    select(subject_ID, code, contains("mean"), contains ("std"))

## Descriptive names(activities) assigned to corresponding code in Tidydata
Tidydata$code <- activities[Tidydata$code, 2]

## Columns were named with descriptive variable names using gsub to identify patterns and replace names 
names(Tidydata) [2] <- "activity"
names(Tidydata) <- gsub("Acc", "Accelerometer", names(Tidydata))
names(Tidydata) <- gsub("Gyro", "Gyroscope", names(Tidydata))
names(Tidydata) <- gsub("BodyBody", "Body", names(Tidydata))
names(Tidydata) <- gsub("Mag", "Magnitude", names(Tidydata))
names(Tidydata) <- gsub("^t", "Time", names(Tidydata))
names(Tidydata) <- gsub("^f", "Frequency", names(Tidydata))
names(Tidydata) <- gsub("tBody", "TimeBody", names(Tidydata))
names(Tidydata) <- gsub("Mean|mean", "Mean", names(Tidydata))
names(Tidydata) <- gsub("std|Std", "Std", names(Tidydata))
names(Tidydata) <- gsub("angle", "Angle", names(Tidydata))
names(Tidydata) <- gsub("gravity", "Gravity", names(Tidydata))

## Final data grouped by activity and subject_ID and means of each subject and activity computed.

Finaldata <- Tidydata %>%
                    group_by(activity, subject_ID) %>%
                    summarise_all(funs(mean))
  
## A new txt file created with the Finaldata df using write.table. Read the contents of the file using read.table                                
                                  
output <- write.table(Finaldata, file= 'FinalData.txt', row.name = FALSE)
output

validate <- read.table("FinalData.txt")
View(validate)



