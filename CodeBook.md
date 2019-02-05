# Codebook for the output of run_analysis.r
## what final_tidy_table.txt means

## Columns one and two
Activity is a factor of one of six activities:
 WALKING
 WALKING_UPSTAIRS
 WALKNG_DOWNSTAIRS
 SITTING
 STANDING
 LAYING

Subject is a number assigned to the thirty subjects: 1-30
 The initial data set had these people split up so 30% could be used for Machine Learning Training, and the remaining 70% to test the ML.  For the purposes of this project we've re-combined them.
 
## Columns three through eighty-one
The remaining seventy-eight columns are values taken from activity trackers worn by the 30 subjects, doing the 6 activities.  These values are the average of all the observations taken for each individual doing each activity, so aren't raw observations, but are a mean.  

To learn more about what each column heading means it is best to refer to the features_info.txt from the inital dataset.
The important information is here:

## Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ 
tBodyAccJerk-XYZ 
tBodyGyro-XYZ 
tBodyGyroJerk-XYZ 
tBodyAccMag 
tGravityAccMag 
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
