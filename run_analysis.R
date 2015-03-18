### Getting and cleaning data course project ###

# set working directory to where data is saved locally
setwd("E:/R_spatial_analysis/Data/UCI HAR Dataset")

# optional step, install the following packages if you haven't previously for use by R
# install.packages("reshape2")


# load required libraries
library(reshape2)
library(plyr)
library(stringr)

## You should create one R script called run_analysis.R that does the following. ##

# 1. Merges the training and the test sets to create one data set.

# read in test and training files
test_data <- read.table("test/X_test.txt")
test_labels <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

train_data <- read.table("train/X_train.txt")
train_labels <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# merge first all the test data into 1 data set
test_merged <- cbind(subject_test,test_labels,test_data)

# merge next the train data into 1 data set
train_merged <- cbind(subject_train,train_labels,train_data)

# merge test and training files to create combined samsung data set
sam_comb <- rbind(test_merged, train_merged)
# bring in variable names 
var_names <- read.table("features.txt")
# rename column variables in combined samsung data set, first set up column names
colNames <- c("subject","activity",as.character(var_names[1:561,2]))
# set column names to combined samsung data set
names(sam_comb) <- colNames

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# extract all the column names with mean() & std()
col_mean <- grep(pattern="mean()", x=names(sam_comb), value=TRUE)
col_std <- grep(pattern="std()", x=names(sam_comb), value=TRUE)
col_extract <- names(sam_comb) %in% col_mean
data_extract_mean <- sam_comb[col_extract]
col_extract <- names(sam_comb) %in% col_std
data_extract_std <- sam_comb[col_extract]
# put data_extract adn data_extract1 together
data_extract <- cbind(data_extract_mean, data_extract_std)

# 3. Uses descriptive activity names to name the activities in the data set

# need to add the activities and subjects to the data set
data_extract <- cbind(sam_comb[1:2],data_extract)

# change activity variable to a factor variable with the names of the activities
# need to read in activity names
activity_labels <- read.table("activity_labels.txt")
data_extract$activity <- as.factor(data_extract$activity) # change to a factor variable
# changing factor level
levels(data_extract$activity) <- activity_labels$V2

# 4. Appropriately labels the data set with descriptive variable names. 
# decided that names from the features set are appropriate but will remove unnecessary brackets ()
names(data_extract) <- gsub("\\()","",names(data_extract))
# make syntactically valid names out of existing names in data_extract 
names(data_extract) <- make.names(names(data_extract), unique=TRUE)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- aggregate(data_extract[,3:81], by=list(activity=data_extract$activity, subject=data_extract$subject), mean)
tidy_data <- melt(tidy_data, id=c("subject","activity")) 
names(tidy_data)[4] <- "Average (mean)"

# write the tidy data set to a text file
write.table(tidy_data, file="tidy.data.txt", row.name=FALSE)
