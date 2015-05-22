#run_analysis.R
#Created by @AndrzejDzedzej
#Collect and reshape data from Human Activity Recognition Using Smartphones Dataset 


#Reading test dataset, i assume that your working directory is UMI HAR Dataset
#If it's not change it using setwd() function
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
  features <- read.table("features.txt")    #reading from features.txt
  names(dataset) <- c(as.character(features$V2))
  names(dataset)[length(dataset) - 1] <- "activity"
  names(dataset)[length(dataset)] <- "subject"


#find positions of std and mean variable columns (step 2)
  column_indexes <- grep("-mean|-std", features[,2], ignore.case = TRUE)

#we want activity and subject columns too, so we append last two columns of dataset 
  column_indexes <- append(column_indexes, c(length(dataset) - 1,length(dataset)))

#subset only needed columns
  dataset <- dataset[,column_indexes]

#activity labels instead of numbers
  activity_labels <- read.table("activity_labels.txt")

#We need dplyr package, installing it if not present
  if("dplyr" %in% rownames(installed.packages()) == FALSE) {
    install.packages("dplyr")
    }
  library("dplyr")

#Join, key = activities, store in tmp table and substite activities in dataset
  tmp_join <- inner_join(dataset, activity_labels, by = c("activity" = "V1"))
  dataset$activity <- tmp_join$V2
#Here we have final tidy dataset (End of Step 4)
  
#We need plyr package for ddply, installing if needed  
  if("plyr" %in% rownames(installed.packages()) == FALSE) {
    install.packages("plyr")
  }
  library("plyr")
  
#Step 5. We use ddply function to take averages of each variable for each activity and subject
  tidy_average <- ddply(dataset, .(subject,activity), .fun = numcolwise(mean))

#Exporting final dataset to txt file
  write.table(tidy_average,"tidy_average.txt", row.name = FALSE)

#Clearing memory
  rm("x_train","y_train","subject_train","x_test","y_test","subject_test","features", "test_data",
     "tmp_join", "activity_labels", "train_data", "dataset")
  