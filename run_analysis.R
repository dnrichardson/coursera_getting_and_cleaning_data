## Dale Richardson - October 9, 2016
## Getting and Cleaning Data - Week 4 Course Project

library(dplyr)
library(tidyr)
library(plyr)

## Task 1: Merge the training and the test sets to create one data set.

## From the readme.txt file, some important info.
## - 'train/X_train.txt': Training set.
## 'train/y_train.txt': Training labels.
## 'test/X_test.txt': Test set.
## 'test/y_test.txt': Test labels.


## Get the features so they can be used as variable names:
myFeatures <- tbl_df(read.table("ucihar_data/features.txt", colClasses = c("NULL", "character")))

## Remove the shitty characters - and () from the column names
noParenthesisFeatures <- myFeatures$V2 %>% gsub("\\-", "_", .) %>%
        gsub("\\(\\)", "", .)
        
## Read in the train and test files using and set the variables according the features col 2
## This satisfies task 4 -- giving the dataset descriptive variable names

trainX <- tbl_df(read.table("ucihar_data/train/X_train.txt", colClasses = "numeric", col.names = noParenthesisFeatures ))
trainy <- tbl_df(read.table("ucihar_data/train/y_train.txt", colClasses = "factor" )) %>% 
        rename(ActivityType = V1)
subjects_train <- tbl_df(read.table("ucihar_data/train/subject_train.txt", colClasses = "factor" )) %>%
        rename(Subject = V1)

testX <- tbl_df(read.table("ucihar_data/test/X_test.txt", colClasses = "numeric", col.names = noParenthesisFeatures ))
testy <- tbl_df(read.table("ucihar_data/test/y_test.txt", colClasses = "factor" )) %>% 
        rename(ActivityType = V1)
subjects_test <- tbl_df(read.table("ucihar_data/test/subject_test.txt", colClasses = "factor" )) %>%
        rename(Subject = V1)

## Link the subject, activity type and measurements with the values using bind_cols()
trainXy <- bind_cols(subjects_train, trainy, trainX)
testXy <- bind_cols(subjects_test, testy, testX)

## Combine the two datasets into one using rbind()
## Col1 is Subject, Col2 is activity type, the rest are the measurements

combined_data <- rbind(trainXy, testXy) 

## Extract only the relevant Variable columns which contain the words "mean" or "std"
## This satisfies task 2 of the assignment.

selectedData <- select(combined_data, 1, 2, matches("mean[_]|mean$|std[_]|std$", ignore.case = FALSE))
#seltmp <- select(tmp, 1, 2, matches("mean[_]|mean$|std[_]|std$", ignore.case = FALSE))

## Task 3 - Use descriptive activity names to name the activities in the data set.
## Replace factor numbers in ActivityType column with their names
## Spread out "ActivityType" into separate variables (or is this even necessary?)

tidySelected <-selectedData %>% mutate(ActivityType = revalue(ActivityType, c("1" = "Walking",
"2" = "Walking_Upstairs", "3" = "Walking_Downstairs", "4" = "Sitting", "5" = "Standing", "6" = "Laying"))) 

## Create a tidy dataset with the average of each variable (even the standard deviations!) for each activity
## and subject. This satisifies task 5. There are 180 entries (6 activity types x 30 subjects with 68 total columns). 
## 66 of these columns are the means (33) and standard deviations (33) of the relevant measurements for this
## assignment. 


byActivity <- tidySelected %>% group_by(ActivityType, Subject) %>% summarize_each(funs(mean)) #%>%
       # arrange(Subject)

## Output the tidy data to file
write.table(byActivity, file = "myTidyData.txt", row.name = FALSE)
## Output the variable names for sake of codebook
write.table(names(byActivity), file = "variableNamesforCodebook.txt", quote = FALSE, col.names = "Variable")



