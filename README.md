## DataCleaning-CourseProject
Course project for Coursera "Getting and cleaning data"

###### Script written with Rstudio v 0.98.1103, R version 3.1.3, on windows x86_64 machine

The goal of the project is to collect, clean, reshape and analyze a dataset. Data used in project comes from sensors in smartphones. 30 subject were performing activities such as walking and standing while wearing these smartphones. Data was collected and divided in test and train group. We want to read that data, reshape into one tidy dataset and then provide some basic summarision on this tidy dataset.
To achieve that we use a script written in R named run_analysis.R which should do the following:

- Step 1.Merges the training and the test sets to create one data set.
- Step 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
- Step 3.Uses descriptive activity names to name the activities in the data set
- Step 4.Appropriately labels the data set with descriptive variable names. 
- Step 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each 	activity and each subject.
- File CodeBook.md contain variable names and descriptions.

run_analysis script do the following:

####Step 1
1.First we read test group data which is placed in 3 files ( X_text.txt - stores feature variables, y_text.txt - store what activity was done in that measurement,
	subject_text.txt - store which subject was measured) and combine it in one data frame column-wise.
2. We do the same for train group.
3. We combine them row-wise to create one data frame consisting all measurements

####Step 4
4. We read features.txt - a file storing proper names for feature variables in our data frame 
5. We attach this names to our data frame, this leaves us with two unnamed variables, we name them manually as activity and subject

####Step 2
6. Now we want only columns that tell about mean or std. To search for such colums we use grep function and pattern matching We search for column names that 
	consist mean or std word. Obwiously we ignore letter sizes. I decided to narrow down search to -mean and -std, because previous search got away with some 
	angle measurement colums which aren't pure std or mean columns, so i decided to cut them off. Grep functon gives us indexes of our colums, we assign it's result
	to vector.
7. Using this vector we subset desired columns and assing it to new dataframe 

####Step 3
8. Our next step is to substitute activities column, which is now represented by integers, by apropriate labels from file activity_labels.txt.
9. We read activity_labels, and because we have full mapping from activities to activities labels we can join these two tables using activities as a key. I decided 
	to use inner_join function from dplyr package because it keep order of left side of the join (in our case this is our main table). So first we perform join, 
	assign it to temporary data frame, and then we substitute activites column in our main data frame. Because inner_join keeps the ordering substitution is correct.
10. At this point we have a tidy dataset.

####Step 5
11. Now we want to create new dataset consisting of averages of each variable for each activity and subject. We use ddply function from dplyr package(chosen over aggregate for perfomance and easibility of usage) to group data frame by subject and activity and apply a function to each set of grouped values and make a desired data frame. We end up with 180 rows (6 activities, 30 subject),for each row we have average of each variable over this subject and activity.
13. We use write.table to export our tidy data to txt file.	


You can read data from Step 5 using this code (Courtesy of David Hood)

 * data <- read.table("tidy_average.txt", header = TRUE) 
 * View(data)
