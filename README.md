Coursera Getting and Cleaning Data - Week 3 Course Project
July 26, 2015

Author: Monica Tamaru Jones

-------
One of the most exciting areas in all of data science right now is wearable computing - see for 
example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the 
most advanced algorithms to attract new users. The data linked to from the course website 
represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full 
description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The project dataset can be found at: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


For the course project, we were expected to :

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of 
each variable for each activity and each subject.

Additonaly, all data was expected to be on Github and a README file and Codebook file should be 
included.

The R code is found in the run_analysis.R file

-------

This program takes in accelerometer data provided by 30 different participants doing 6 
different actions. There are many different data for any given participant performing any given 
action. 
The point of this assignment is to tidy the data so that you are only looking at columns that 
contain mean or stand deviation data. From these columns of data, we are to further simplify the 
data by getting the mean value of each of these columns for the  six different actions per 
person (180 data points). 

------
Read the README.txt - Accel Data for a fuller understanding of the project and the variables 
that were provided to us for this project.
