#  Run Analysis Script - By David Searl
#
#
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Load both Train and Test into tibbles
test <- read_delim("./data/UCI HAR Dataset/test/X_test.txt", col_names = F, delim = " ", col_types = list(.default = col_number()))
test_activities <- read_delim("./data/UCI HAR Dataset/test/y_test.txt", col_names = F, delim = " ")
test_subjects <- read_delim("./data/UCI HAR Dataset/test/subject_test.txt", col_names = F, delim = " ")
test <- cbind(test_subjects, test_activities,test)

train <- read_delim("./data/UCI HAR Dataset/train/X_train.txt", col_names = F, delim = " ", col_types = list(.default = col_number()))
train_activities <- read_delim("./data/UCI HAR Dataset/train/y_train.txt", col_names = F, delim = " ")
train_subjects <- read_delim("./data/UCI HAR Dataset/train/subject_train.txt", col_names = F, delim = " ")
train <- cbind(train_subjects, train_activities,train)

## 1. Lets rbind the full set.
full_set <- rbind(test,train)

## Lets clean up our environment
rm(list = c("test","test_activities","test_subjects","train","train_activities","train_subjects"))

## 3. Lets add in headers. First pull from features, then add on subject and activity
headers <- read_delim("./data/UCI HAR Dataset/features.txt", col_names=F, delim=" ")[,2]
colnames(full_set) <- c("subject", "activity", headers[[1]])
rm(headers)

## Lets change these to factors since they act like it 
full_set$subject <- as.factor(full_set$subject)
full_set$activity <- as.factor(full_set$activity)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## We use grepl to create a logical vector of columns we're looking for, then subset the columns by this vector

smaller_set <- full_set[ , grepl("^subject|^activity|std|mean",colnames(full_set)) ]

## 4. load activity labels, then using mapvalues, replace the activity numbers with activity names
activity_labels <- read_delim("./data/UCI HAR Dataset/activity_labels.txt", col_names = F, delim=" ")
smaller_set$activity <- mapvalues(smaller_set$activity, activity_labels$X1, activity_labels$X2)
rm(activity_labels)

## 5. Create second, independent tidy data set with the average of each variable for each activity and each subject
final_tidy_tibble <- smaller_set %>% group_by(activity, subject) %>% summarise_all(mean)

write.table(final_tidy_tibble, "./data/UCI HAR Dataset/final_tidy_table.txt", row.names = F)
## Thanks!

##Not Needed since features.txt is as descriptive and clear as needed.
##colnames(final_tidy_tibble) <- gsub("tBody","body", colnames(final_tidy_tibble))
##colnames(final_tidy_tibble) <- gsub("tGravity","gravity", colnames(final_tidy_tibble))
##colnames(final_tidy_tibble) <- gsub("Acc"," acceleration", colnames(final_tidy_tibble))
##colnames(final_tidy_tibble) <- gsub("Jerk"," jerk", colnames(final_tidy_tibble))
##colnames(final_tidy_tibble) <- gsub("Mag"," magnitude", colnames(final_tidy_tibble))
##colnames(final_tidy_tibble) <- gsub("fBody","fourier transformed body", colnames(final_tidy_tibble))

 