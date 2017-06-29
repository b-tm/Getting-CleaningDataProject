Code Book
Raw Data

The initial data was obtained from UCI Machine Learning Repository, Human Activity Recognition Using Smartphones Data Set, 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

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
arCoeff(): Autoregression coefficients with Burg order equal to 4
correlation(): Correlation coefficient between two signals
maxInds(): Index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): Skewness of the frequency domain signal
kurtosis(): Kurtosis of the frequency domain signal
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between some vectors.

Merge the training and the test sets
Test set and training set data (X_train.txt, X_test.txt), activity ids (y_train.txt, y_test.txt), subject ids (subject_train.txt, subject_test.txt) were merged to obtain a single data set. Variables are labelled with the names assigned by original collectors (features.txt).
The mean and standard deviation variables were extracted 
From the merged data set was extracted an little data set with only the values of estimated mean and standard deviation.
Replacing the activity names with descriptive ones
A new column was added to connect data set with the activity description. Activity id column is used to look up descriptions in activity_labels.txt.

The following table binds the signals with the names used as prefix for the variables 

Name	Time domain	Frequency domain
Body Acceleration	TimeDomain.BodyAcceleration.XYZ	FrequencyDomain.BodyAcceleration.XYZ
Gravity Acceleration	TimeDomain.GravityAcceleration.XYZ	
Body Acceleration Jerk	TimeDomain.BodyAccelerationJerk.XYZ	FrequencyDomain.BodyAccelerationJerk.XYZ
Body Angular Speed	TimeDomain.BodyAngularSpeed.XYZ	FrequencyDomain.BodyAngularSpeed.XYZ
Body Angular Acceleration	TimeDomain.BodyAngularAcceleration.XYZ	
Body Acceleration Magnitude	TimeDomain.BodyAccelerationMagnitude	FrequencyDomain.BodyAccelerationMagnitude
Gravity Acceleration Magnitude	TimeDomain.GravityAccelerationMagnitude	
Body Acceleration Jerk Magnitude	TimeDomain.BodyAccelerationJerkMagnitude	FrequencyDomain.BodyAccelerationJerkMagnitude
Body Angular Speed Magnitude	TimeDomain.BodyAngularSpeedMagnitude	FrequencyDomain.BodyAngularSpeedMagnitude
Body Angular Acceleration Magnitude	TimeDomain.BodyAngularAccelerationMagnitude	FrequencyDomain.BodyAngularAccelerationMagnitude

