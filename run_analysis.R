# Assumption
#1. UCI HAR Dataset zipfile is downloaded and extracted in working directory.
#2. run_analysis.R script is placed at same folder level to the extracted UCI HAR Dataset.

# Loading the training and testing dataset
training <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
testing <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)

# Merge training and testing dataset to full dataset
raw <- rbind(training,testing)

# Create subject table
trainingsub <- read.csv("./UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
testingsub <- read.csv("./UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
sub <- rbind (trainingsub,testingsub)

# Create activity table
trainingactivity <- read.csv("./UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
testingactivity <- read.csv("./UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
activitylabel <- rbind(trainingactivity,testingactivity)

# Join the subject table and activity table to raw dataset
raw <- cbind(raw,sub,activitylabel)

# Create features table
features <- read.table("./UCI HAR Dataset/features.txt", sep = "", header = FALSE)

# Modify column names
features$V2 <- tolower(features$V2)
features$V2 <- gsub ("-","",features$V2)
features$V2 <- gsub (",","",features$V2)
features$V2 <- gsub ("\\(","",features$V2)
features$V2 <- gsub ("\\)","",features$V2)

# Extracts only the measurements on the mean and standard deviation for each measurement
meanstd <- grep(".*mean.*|.*std.*", features$V2)

# This is the extraction from the raw dataset where 
# only measurements on the mean and standard deviation are selected
# Include column 562 and 563 for subject and activity label respectively
full <- raw[,c(562,563,meanstd)]

# Rename selected dataset columns to their respective features
colnames(full) <- c("subject","activity",features$V2[meanstd])

# Create label description table
activitydesc <- read.csv("./UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)
colnames(activitydesc) <- c("activity","activitydescription")

# Merge subject and label description name to create full subject info table
full <- merge(activitydesc,full)

# Convert subject and label into factor to avoid being summarize as mean in the aggregate function
full$subject <- as.factor(full$subject)
full$activity <- as.factor(full$activity)

# Aggregate the dataset with average of variables for each subject and activity
aggregate <- aggregate(full[,-c(1:3)], by=list(subject = full$subject,activitydescription = full$activitydescription), FUN=mean, na.rm=TRUE)

# Output the aggregated table
write.table(aggregate,"aggregate.txt",sep="\t",row.names = FALSE)

# Remove all the objects from environment except the tidy dataset
rm(list=setdiff(ls(), "aggregate"))
