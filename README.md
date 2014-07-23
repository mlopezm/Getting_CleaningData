---
title: "README.md"
author: "Manuel L Martin"
date: "Thursday, July 24, 2014"

---

In order to accomplish the transformation please run:
- run_analysis.R

This script will do all the transformations and will generate the file with the tidy data in tidy_data.txt, which is a csv document.

The script does the following:
- Read the data
- Merges the training and the test sets to create one data set.
- Appropriately labels the data set with descriptive variable names. 
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Create a single data set with all the changes above
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
- Write the data to a file
