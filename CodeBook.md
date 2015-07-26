This code book was created to accompany the Week 3 Coure Project for Getting and Cleaning Data 
class from Coursera, taught by Johns Hopkins - Bloomberg School of Public Health.

This file descibes the variables, data and transformations to the data that I have performed to
provide the cleaned up text file, CleaningDataCourseProject.txt

The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Author of Code Book: Monica Tamaru Jones
------

R Code file: run_analysis.R

 - Use the dplyr and plyr library

 1. VAR: features -- line 6 reads in the features.txt file. This will be used for the column 
 names of the data provided in the X_train.txt and the X_test.txt.

 2. VAR: trainx - holds the X_train.txt data - column names set with features data
 	VAR: trainy - holds the y_train.txt data - column name set to Activity
 	VAR: trainsub - holds the subject_train.txt data - column name set to Person_ID
 	VAR: mixed_train - binds the data together into one file

 3. VAR: testx, testy, testsub, mixed_test - same as above, but with the test data

 4. VAR: combo - rbinds the data together so there is one big file containing both train and 
 test data

 5. ACTION: I rename all of the Activity data with the descriptions coming from the
  activity_labels.txt file (lines 32-37). I leave the numbers to help with sorting later.

 6. VAR: tidy_id - strip out the person id and activity columns
 	VAR: tidy_mean - select all of the columns that have "mean" in the name
 	VAR: tidy_std - select all of the columns that have "std" in the name

 	VAR: tidy - cbinds all the tidy dataframes together into one file
 	VAR: tidy_sort - sorted by Person_ID, then by activity number

 7. VAR: person_and_activity - for loops create the first columns of the dataframe with the 
 structure of "Person # " and "Activity". I chose to put these together as it worked well for 
 this particular project. I would probably keep them apart in the furture. (lines 51-62)

 * I had some issues in getting this data presented cleanly and correctly. The following seemed to work, but I'd do it differently next time.

 8. VAR: final - holds my final dataframe with only the data I want. Initialized with correct 
 column names, and unfortunetly took the first line of data from tidy_sort. This is zeroed out 
 in the next line (66).

 9. ACTION: To get the # of colomns to match when I rbind during the mean calculation, I 
 temporarily removed the Person_ID and Activity data

 10.ACTION: for loops run through each person, then each action.

 10a. VAR: per - temp holder used for person data, runs through each action
 	  VAR: per1 - temp holder used with lapply to calculate the mean of the column data for an
 	  individual in a particular action
 	  * column names got messed up with per2 (not sure why), so reinitialozed with same names of 
 	  per so that the rbind would work

 	  final holds all the mean data calculated in the for loops

 11. ACTION: Further cleaning due to bad set up. Zeroed row in final removed, Cbind person_id 
 and activity data

 12. VAR: Submission - write table of final to file CleaningDataCourseProject.txt


This concludes the Code Book information.