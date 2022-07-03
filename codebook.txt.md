---
title: "Getting and Cleaning data-Course Project Codebook"
output: html_notebook
Author: Sangeetha 
---

1. Run_analysis script performs the step wise cleaning of the dataset "UCI HAR dataset"

2. Download Dataset:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Run_analysis does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Description:

Extract data frames and merge test and train datasets; subset mean and std variables and rename variables with descriptive names. Compute mean of each variable for each subject.

The final tidy data is output in "Finaldata.txt" containing 180 rows, 88 columns







