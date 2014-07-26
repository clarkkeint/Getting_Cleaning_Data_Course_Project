1. Source of the data for the project
   download the data from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
   then unzip the data in work directory.
   
2. run R script called "run_analysis.R"

3. Output a tidy data set called "Tidy Data.txt"

4. Data transformation by "run_analysis.R"
 
	4.1 Read the training and the test sets in "train/X_train.txt" and "test/X_est.txt", and then merge them;

	4.2 Read corresponding Training activity labels and Testing activity labels in "train/y_train.txt" and "test/y_test.txt", and then merge them;

	4.3 Read corresponding Training subject labels and Testing subject labels "train/subject_train.txt" and "test/subject_test.txt", and then merge them;

	4.4 Merge all the data sets getting from 4.1 to 4.3 to to create one data set named "data_total_set";

	4.5 Appropriately labels the data set with descriptive variable names;	

	4.6 Uses descriptive activity names to name the activities in the data set;

	4.7 Extracts only the measurements on the mean and standard deviation for each measurement;

	4.8 Creates a independent tidy data set with the average of each variable for each activity and each subject named "data_tidy";

	4.9 Saved "data_tidy" in the file "Tidy Data.txt".