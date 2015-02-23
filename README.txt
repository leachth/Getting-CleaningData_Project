Run_analysis.R creates a summary data set of the Human Activity Recognition Using 
Smartphones data set that is available here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

This data set was produced from an experiment where subjects were asked to go through a 
variety of movements including walking, standing, sitting, laying and walking up or 
down stairs while wearing a smartphone on their waist. Three- dimensional data on 
the acceleration and angular velocity in the X, Y and Z dimensions were collected. The 
data set was randomly split into a training and a testing data set (split 70:30).
More detailed information on the experiment and all metadata can be found here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The run_analysis script merges the testing and training data sets and creates a  
table that summarizes (by averaging) the average and standard deviations for all 
acceleration and angular velocity measurements reported in the experiment for each 
subject and each activity. 

Summary data set: Metadata/Codebook
subject.no 		a unique identifier for each person in the experiment (1-30)
activity 		character variable describing the activity ( WALKING, WALKING_UPSTAIRS, 
				WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
... 			variables 3 - 79 are names as follows:

Variables 3-79 are the acceleration and angular velocity variables. 
They are described using the format  "qvariable - summary()-A" 
where q is either t(time) or f(frequency), variable represents the acceleration or 
angular velocity variable measured by the experimenters, summary is either a mean or a 
standard deviation, written as mean or std and the A represents the dimension, 
either X,Y or Z.

tBodyAcc-mean()-X	
tBodyAcc-mean()-Y	
tBodyAcc-mean()-Z	
tBodyAcc-std()-X	
tBodyAcc-std()-Y	
tBodyAcc-std()-Z	
tGravityAcc-mean()-X	
tGravityAcc-mean()-Y	
tGravityAcc-mean()-Z	
tGravityAcc-std()-X	
tGravityAcc-std()-Y	
tGravityAcc-std()-Z	
tBodyAccJerk-mean()-X	
tBodyAccJerk-mean()-Y	
tBodyAccJerk-mean()-Z	
tBodyAccJerk-std()-X	
tBodyAccJerk-std()-Y	
tBodyAccJerk-std()-Z	
tBodyGyro-mean()-X	
tBodyGyro-mean()-Y	
tBodyGyro-mean()-Z	
tBodyGyro-std()-X	
tBodyGyro-std()-Y	
tBodyGyro-std()-Z	
tBodyGyroJerk-mean()-X	
tBodyGyroJerk-mean()-Y	
tBodyGyroJerk-mean()-Z	
tBodyGyroJerk-std()-X	
tBodyGyroJerk-std()-Y	
tBodyGyroJerk-std()-Z	
tBodyAccMag-mean()	
tBodyAccMag-std()	
tGravityAccMag-mean()	
tGravityAccMag-std()	
tBodyAccJerkMag-mean()	
tBodyAccJerkMag-std()	
tBodyGyroMag-mean()	
tBodyGyroMag-std()	
tBodyGyroJerkMag-mean()	
tBodyGyroJerkMag-std()	
fBodyAcc-mean()-X	
fBodyAcc-mean()-Y	
fBodyAcc-mean()-Z	
fBodyAcc-std()-X	
fBodyAcc-std()-Y	
fBodyAcc-std()-Z	
fBodyAcc-meanFreq()-X	
fBodyAcc-meanFreq()-Y	
fBodyAcc-meanFreq()-Z	
fBodyAccJerk-mean()-X	
fBodyAccJerk-mean()-Y	
fBodyAccJerk-mean()-Z	
fBodyAccJerk-std()-X	
fBodyAccJerk-std()-Y	
fBodyAccJerk-std()-Z	
fBodyAccJerk-meanFreq()-X	
fBodyAccJerk-meanFreq()-Y	
fBodyAccJerk-meanFreq()-Z	
fBodyGyro-mean()-X	
fBodyGyro-mean()-Y	
fBodyGyro-mean()-Z	
fBodyGyro-std()-X	
fBodyGyro-std()-Y	
fBodyGyro-std()-Z	
fBodyGyro-meanFreq()-X	
fBodyGyro-meanFreq()-Y	
fBodyGyro-meanFreq()-Z	
fBodyAccMag-mean()	
fBodyAccMag-std()	
fBodyAccMag-meanFreq()	
fBodyBodyAccJerkMag-mean()	
fBodyBodyAccJerkMag-std()	
fBodyBodyAccJerkMag-meanFreq()	
fBodyBodyGyroMag-mean()	
fBodyBodyGyroMag-std()	
fBodyBodyGyroMag-meanFreq()	
fBodyBodyGyroJerkMag-mean()	
fBodyBodyGyroJerkMag-std()	
fBodyBodyGyroJerkMag-meanFreq()