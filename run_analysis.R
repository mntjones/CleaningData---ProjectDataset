library(plyr)
library(dplyr)

# Read in features.txt data for column name headings

features <- read.table("features.txt", header = FALSE, stringsAsFactors = FALSE)

# Read in training set data and set column names

trainx <- read.table("train/X_train.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(trainx) <- features$V2
trainy <- read.table("train/y_train.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(trainy) <- "Activity"
trainsub <- read.table("train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(trainsub) <- "Person_ID"
mixed_train <- cbind(trainsub, trainy, trainx)

# Read in the test set data and set column names
testx <- read.table("test/X_test.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(testx) <- features$V2
testy <- read.table("test/y_test.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(testy) <- "Activity"
testsub <- read.table("test/subject_test.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(testsub) <- "Person_ID"
mixed_test <- cbind(testsub, testy, testx)

# Combine train and test data

combo <- rbind(mixed_train, mixed_test)

#rename Y-Data to action names
combo$"Activity"[combo$"Activity" == 1] <- "1-Walking"
combo$"Activity"[combo$"Activity" == 2] <- "2-Walking_Upstairs"
combo$"Activity"[combo$"Activity" == 3] <- "3-Walking_Downstairs"
combo$"Activity"[combo$"Activity" == 4] <- "4-Sitting"
combo$"Activity"[combo$"Activity" == 5] <- "5-Standing"
combo$"Activity"[combo$"Activity" == 6] <- "6-Laying"

# from the features.txt document, the columns with the mean and std - selected all columns with 
# either mean() or std() in column name
tidy_id <- data.frame(combo[,1:2])
tidy_mean <- combo[,grepl("mean()", colnames(combo))]
tidy_std <- combo[,grepl("std()", colnames(combo))]

# combine column data for all mean and std columns
tidy <- cbind (tidy_id, tidy_mean, tidy_std)
# Sort by person ID and Activity #
tidy_sort <- arrange(tidy, Person_ID, Activity)

# Creates first column titles for final data frame (Person # : Activity)
person_and_activity <- c()
j <- 1 # index for for loop
k <- 1 # index for for loop
act <- c("1-Walking", "2-Walking_Upstairs", "3-Walking_Downstairs", "4-Sitting", "5-Standing", "6-Laying")
for (i in 1:30) {
    while (j < 7) {
        person_and_activity[k] <- paste("Person ",i, " : ", act[j])
        j <- j + 1
        k <- k +1
    }
    j <- 1
}

# Data for data frame
final <- tidy_sort[1,] # initializes columns
final[1,] <- 0 # Removes data (need to clean up when more time to simplify code)
final <- select(final, -(Person_ID:Activity)) # removes the first two non-data columns so I can rbind

# for loops to get mean values for each person, per activity
for (i in 1:30) {
    for (j in 1:6){
        per <- filter(tidy_sort, Person_ID == i, Activity == act[j])
        per <- select(per, -(Person_ID:Activity))
        per1 <- data.frame(lapply(per[,1:length(per)],  mean))
        colnames(per1) <- colnames(per)
        final <- rbind(final,per1)
    }
}

# Further cleaning
# remove zeroed row to initialize
final <- final[-1,]
#add back the person/activity data - THIS IS COMBINED INTO ONE COLUMN AS DISTINCT DATA
final <- cbind(person_and_activity, final)

# write table for submission

submission <- write.table(final, file = "CleaningDataCourseProject.txt", row.names = FALSE)
