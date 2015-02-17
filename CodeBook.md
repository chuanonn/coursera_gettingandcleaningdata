# CodeBook for Data
## Raw Data
The dataset originate from "Human Activity Recognition Using Smartphone Data Set" in UCI Machine Learning Repository.

Link to the dataset : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The downloaded ZIP file contains the 
 1. Training and testing data set of 30 subject participated in the experiments.
 2. Features of the variables recorded
 3. Activities descriptions

## Brief Introduction to the Data
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 

These signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

## Logic of Preparing the Required Dataset
All feature names are modified to lower case and any symbols are removed.

Example:
* tBodyAcc-mean()-X is turned into tbodyaccmeanx
* angle(X,gravityMean) is changed into anglexgravitymean


Of the total set of variables estimated, only mean and standard deviation measurement are selected.
 1. mean(): Mean value
 2. std(): Standard deviation 
 
As the requirements in the assignment stated "Extracts only the measurements on the mean and standard deviation for each measurement", additional vectors obtained by averaging the signals is also included.

Included Variables are:
 1. gravityMean
 2. tBodyAccMean
 3. tBodyAccJerkMean
 4. tBodyGyroMean
 5. tBodyGyroJerkMean

Table extracted are then named with a descriptive activities label and aggregate by their average at subject and activity level.
