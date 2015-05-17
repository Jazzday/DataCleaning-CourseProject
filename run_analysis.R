#run_analysis.R
#Created by @AndrzejDzedzej
#Collect and reshape data from Human Activity Recognition Using Smartphones Dataset 


#Reading test dataset
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#Merge test dataset
test_data <- cbind(x_test,y_test,subject_test)

#Read train dataset
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#Merge train dataset
train_data <- cbind(x_train, y_train, subject_train)

#Merge test and train (end of assignment step 1)
dataset <- rbind(test_data, train_data)

#name variables in dataset using features.txt (Step 4)
features <- read.table("features.txt") #reading from features.txt
names(dataset) <- c(as.character(features$V2))
names(dataset)[length(dataset) - 1] <- "activity"
names(dataset)[length(dataset)] <- "subject"


#find positions of std and mean variable columns (step 2)
column_indexes <- grep("-mean|-std", features[,2], ignore.case = TRUE)

#we want activity and subject columns too, we append last two columns of dataset 
column_indexes <- append(column_indexes, c(length(dataset) - 1,length(dataset)))

#subset only needed columns
dataset <- dataset[,column_indexes]

#activity labels instead of numbers
activity_labels <- read.table("activity_labels.txt")

#We need dplyr package, installing it if not present
if("dplyr" %in% rownames(installed.packages()) == FALSE) {
  install.packages("xtable")
  }
library("dplyr")

#Join, key = activities, store in tmp table and substite activities in dataset
tmp_join <- inner_join(dataset, activity_labels, by = c("activity" = "V1"))
dataset$activity <- tmp_join$V2
#Here we have final tidy dataset (End of Step 4)

#Step 5. We use aggregate to create dataset containtig averages of each variable for each attivity and subject
#ignore warnings, they are not harmful
tidy_average <-aggregate(dataset,by = list(dataset$subject, dataset$activity), FUN = mean)

#We tidy up names and duplicated colmns
tidy_average$subject<- NULL
tidy_average$activity <- NULL
names(tidy_average)[1] <- "subject"
names(tidy_average)[2] <- "activity"

#Exporting final dataset to txt file
write.table(tidy_average,"tidy_average.txt", row.name = FALSE)