*Getting and Cleaning Data - Course Project*
=============================================

This code book describes the variables, the data, and any transformations or work that was performed to clean up the data.

### Links to Original Datasets

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Variables in the original data

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
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

### Variables used in this project and variable transformations

Of the 561 original variables estimated from the signals, a subset of 86 were selected for inclusion in the final analysis. Only standard deviation and mean estimates of signal variables were considered. In addition, three variables that capture subject IDs, activity numbers and activity descriptions were included. All these variables are listed below.

Please note that the variable names were tranformed into the current names by removing brackets, replacing commas and dashes with underscores, by expanding abbreviations to their full equivalents and removing word redundancies. The underscore was used despite the conventions for naming variables for both readability and compatibility considerations (other software packages as SAS favor underscore use over other symbols).

Variable Name | Description  
------------- | -----------
subjectNumber	| A number from 1 to 30 representing the identifier of the subject who carried out the experiment.   
activityName | One of 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed by each person wearing a smartphone (Samsung Galaxy S II) on the waist.
activityNumber | A number from 1 to 6 representing the activity numeric identifier.
angleX_gravityMean | Mean gravitational force in the x direction.
angleY_gravityMean | Mean gravitational force in the y direction.
angleZ_gravityMean | Mean gravitational force in the z direction.
fBodyAccelerometer_mean_X | Frequency domain variable; Average body acceleration in the x direction.
fBodyAccelerometer_mean_Y | Frequency domain variable; Average body acceleration in the y direction.	
fBodyAccelerometer_mean_Z | Frequency domain variable; Average body acceleration in the z direction.	
fBodyAccelerometer_meanFreq_X	| Frequency domain variable; Mean frequency of body linear acceleration in the x direction.
fBodyAccelerometer_meanFreq_Y | Frequency domain variable; Mean frequency of body linear acceleration in the y direction.	
fBodyAccelerometer_meanFreq_Z | Frequency domain variable; Mean frequency of body linear acceleration in the z direction.	
fBodyAccelerometer_std_X | Frequency domain variable; Standard deviation of body linear acceleration in the x direction.	
fBodyAccelerometer_std_Y | Frequency domain variable; Standard deviation of body linear acceleration in the y direction.  	
fBodyAccelerometer_std_Z | Frequency domain variable; Standard deviation of body linear acceleration in the z direction.  	
fBodyAccelerometerJerk_mean_X | Frequency domain variable; Average of jerk signal body linear acceleration in the x direction.	
fBodyAccelerometerJerk_mean_Y | Frequency domain variable; Average of jerk signal body linear acceleration in the y direction.	
fBodyAccelerometerJerk_mean_Z | Frequency domain variable; Average of jerk signal body linear acceleration in the z direction.	
fBodyAccelerometerJerk_meanFreq_X | Frequency domain variable; Mean frequency of jerk signal body linear acceleration in the x direction.  	
fBodyAccelerometerJerk_meanFreq_Y | Frequency domain variable; Mean frequency of jerk signal body linear acceleration in the y direction.  	
fBodyAccelerometerJerk_meanFreq_Z | Frequency domain variable; Mean frequency of jerk signal body linear acceleration in the z direction.  	
fBodyAccelerometerJerk_std_X | Frequency domain variable; Standard deviation of body linear acceleration in the x direction based on jerk signals.  	
fBodyAccelerometerJerk_std_Y | Frequency domain variable; Standard deviation of body linear acceleration in the y direction based on jerk signals.  	
fBodyAccelerometerJerk_std_Z | Frequency domain variable; Standard deviation of body linear acceleration in the z direction based on jerk signals.  	
fBodyAccelerometerJerkMagnitude_mean | Frequency domain variable; Average magnitude of jerk signal body linear acceleration.  	
fBodyAccelerometerJerkMagnitude_meanFreq | Frequency domain variable; Mean frequency of magnitude of jerk signal body linear acceleration.    	
fBodyAccelerometerJerkMagnitude_std | Frequency domain variable; Standard devisation of magnitude of jerk signal body linear acceleration.    	
fBodyAccelerometerMagnitude_mean | Frequency domain variable; Average magnitude of body linear acceleration.    	
fBodyAccelerometerMagnitude_meanFreq | Frequency domain variable; Average frequency of magnitude of body linear acceleration.	
fBodyAccelerometerMagnitude_std | Frequency domain variable; Standard deviation of magnitude of body linear acceleration.	
fBodyGyroscope_mean_X	| Frequency domain variable; Average angular velocity in the x direction.
fBodyGyroscope_mean_Y | Frequency domain variable; Average angular velocity in the y direction.
fBodyGyroscope_mean_Z | Frequency domain variable; Average angular velocity in the z direction.	
fBodyGyroscope_meanFreq_X | Frequency domain variable; Mean frequency angular velocity in the x direction.	
fBodyGyroscope_meanFreq_Y | Frequency domain variable; Mean frequency angular velocity in the y direction.	
fBodyGyroscope_meanFreq_Z | Frequency domain variable; Mean frequency angular velocity in the z direction.	
fBodyGyroscope_std_X | Frequency domain variable; Standard deviation of angular velocity in the x direction.    	
fBodyGyroscope_std_Y | Frequency domain variable; Standard deviation of angular velocity in the y direction. 	
fBodyGyroscope_std_Z | Frequency domain variable; Standard deviation of angular velocity in the z direction. 	
fBodyGyroscopeJerkMagnitude_mean | Frequency domain variable; Average magnitude of jerk signal angular velocity.    	
fBodyGyroscopeJerkMagnitude_meanFreq | Frequency domain variable; Mean frequency of magnitude of jerk signal angular velocity.      	
fBodyGyroscopeJerkMagnitude_std | Frequency domain variable; Standard devisation of magnitude of jerk signal angular velocity.      	
fBodyGyroscopeMagnitude_mean | Frequency domain variable; Average magnitude of angular velocity.	
fBodyGyroscopeMagnitude_meanFreq | Frequency domain variable; Average frequency of magnitude of angular velocity.  	
fBodyGyroscopeMagnitude_std | Frequency domain variable; Standard deviation of magnitude of angular velocity.	
tBodyAccelerometer_mean_X	| Time domain variable; analogous to its frequency domain counterpart.
tBodyAccelerometer_mean_Y  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyAccelerometer_mean_Z  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyAccelerometer_std_X  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyAccelerometer_std_Y  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyAccelerometer_std_Z  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyAccelerometerJerk_mean_X  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyAccelerometerJerk_mean_Y  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyAccelerometerJerk_mean_Z	| Time domain variable; analogous to its frequency domain counterpart.
tBodyAccelerometerJerk_std_X  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyAccelerometerJerk_std_Y  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyAccelerometerJerk_std_Z  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyAccelerometerJerkMagnitude_mean  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyAccelerometerJerkMagnitude_std  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyAccelerometerMagnitude_mean  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyAccelerometerMagnitude_std  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscope_mean_X  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscope_mean_Y  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscope_mean_Z  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscope_std_X  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscope_std_Y  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscope_std_Z  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscopeJerk_mean_X  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscopeJerk_mean_Y  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscopeJerk_mean_Z  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscopeJerk_std_X  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscopeJerk_std_Y  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscopeJerk_std_Z  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscopeJerkMagnitude_mean  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscopeJerkMagnitude_std  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscopeMagnitude_mean  | Time domain variable; analogous to its frequency domain counterpart.	
tBodyGyroscopeMagnitude_std  | Time domain variable; analogous to its frequency domain counterpart.	
tGravityAccelerometer_mean_X | Time doman variable; Mean gravity acceleration in the x direction.
tGravityAccelerometer_mean_Y | Time doman variable; Mean gravity acceleration in the y direction.	
tGravityAccelerometer_mean_Z | Time doman variable; Mean gravity acceleration in the z direction.	
tGravityAccelerometer_std_X | Time doman variable; Standard deviation of gravity acceleration in the x direction.	
tGravityAccelerometer_std_Y | Time doman variable; Standard deviation of gravity acceleration in the y direction.	
tGravityAccelerometer_std_Z | Time doman variable; Standard deviation of gravity acceleration in the z direction.	
tGravityAccelerometerMagnitude_mean | Time doman variable; Mean of magnitude of gravity acceleration.	
tGravityAccelerometerMagnitude_std | Time doman variable; Standard deviation of magnitude of gravity acceleration.  	




