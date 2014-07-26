## Get and clean from Samsung data
run_analysis <- function(){
# Check if the zipfile is  unzipped. if not,unzip the zipfile in work directory  
if (!file.exists("./UCI HAR Dataset")) {    
    unzip(zipfile = "./getdata_projectfiles_UCI HAR Dataset.zip")
}

## Read Train data
# Read Training set
data_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
# Read Training activity labels
data_train_activity <- read.table("./UCI HAR Dataset/train/Y_train.txt")
# Read Training subject labels
data_train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Read Test data
# Read Test set
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
# Read Test activity labels
data_test_activity <- read.table("./UCI HAR Dataset/test/Y_test.txt")
# Read Test subject labels
data_test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Merge the training and the test data
# Merge the training and the test sets into data sets
data_total_set <- rbind(data_train,data_test)
# Merge the training and the test activity labels
data_total_activity <- rbind(data_train_activity,data_test_activity)
# Merge the training and the test subject labels
data_total_subject <- rbind(data_train_subject,data_test_subject)

## Use descriptive variable names to name the variable in the data set
# Read feature names 
data_name <- read.table("./UCI HAR Dataset/features.txt")
# Use feature names as descriptive variable names
colnames(data_total_set) <- as.character(data_name[,2])
# Name activity and subject labels
colnames(data_total_activity) <- "Activity"
colnames(data_total_subject) <- "No.Subject"

## Merge activity and subject labels with data sets
data_total <- cbind(data_total_activity,data_total_subject,data_total_set)

## Calculate the average of each variable for each activity and each subject
# Average values stored in data_mean
data_mean <- data.frame()
for(i  in 1:6){
  for(j in  1:30){
    mean_a_row <- apply(data_total[data_total$Activity==i & data_total$No.Subject==j,],2,mean)    
    data_mean <- rbind(data_mean,mean_a_row)
  }
}
# Name the variable of data_mean
colnames(data_mean) <- gsub("()","",colnames(data_total),fixed = TRUE)
colnames(data_mean) <- gsub("BodyBody","Body",colnames(data_mean),fixed = TRUE)


## Extracts only the measurements on the mean and standard deviation for each measurement
# Extracts the variables whose names comprise  "mean" of "std" 
data_middle_tidy <- data_mean[,c(1,2,grep("*-mean|-std*", colnames(data_mean)))]
# Eliminate the variables whose names comprise "meanFreq"
data_tidy <- data_middle_tidy[,grep("*-meanFreq*", colnames(data_middle_tidy),invert = TRUE)]

## Use descriptive activity names to name the activities
# convertco integer into  factor
data_tidy$Activity <- as.factor(data_tidy$Activity)
# replace number levels by activity names
levels(data_tidy$Activity) <- list(WALKING="1", WALKING_UPSTAIRS="2", WALKING_DOWNSTAIRS="3", SITTING="4",STANDING
= "5",LAYING = "6")

## output tidy data into a file named "Tidy Data.csv"
write.csv(data_tidy, file = "Tidy Data.txt",row.names=FALSE)
}
