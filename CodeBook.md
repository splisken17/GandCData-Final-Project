## Source Data

The data for this project is from the UCI Machine Learning Repository. More info can be found at this location:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The data can be found here:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The dataset includes the following files:

-   'README.txt'

-   'features_info.txt': Shows information about the variables used on the feature vector.

-   'features.txt': List of all features.

-   'activity_labels.txt': Links the class labels with their activity name.

-   'train/X_train.txt': Training set.

-   'train/y_train.txt': Training labels.

-   'test/X_test.txt': Test set.

-   'test/y_test.txt': Test labels.

## Variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:\
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ tGravityAcc-XYZ tBodyAccJerk-XYZ tBodyGyro-XYZ tBodyGyroJerk-XYZ tBodyAccMag tGravityAccMag tBodyAccJerkMag tBodyGyroMag tBodyGyroJerkMag fBodyAcc-XYZ fBodyAccJerk-XYZ fBodyGyro-XYZ fBodyAccMag fBodyAccJerkMag fBodyGyroMag fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

mean(): Mean value std(): Standard deviation mad(): Median absolute deviation max(): Largest value in array min(): Smallest value in array sma(): Signal magnitude area energy(): Energy measure. Sum of the squares divided by the number of values. iqr(): Interquartile range entropy(): Signal entropy arCoeff(): Autorregresion coefficients with Burg order equal to 4 correlation(): correlation coefficient between two signals maxInds(): index of the frequency component with largest magnitude meanFreq(): Weighted average of the frequency components to obtain a mean frequency skewness(): skewness of the frequency domain signal kurtosis(): kurtosis of the frequency domain signal bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window. angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean tBodyAccMean tBodyAccJerkMean tBodyGyroMean tBodyGyroJerkMean

## Data Cleaning

The run_analysis.R script was used to transform and tidy the data. This process was completed through the following steps:

1.  Downloaded the data set

2.  Read in the data and assigned column names, using the features file for the xtest and xtrain column names

3.  Merged the x_train/ x_test data, y_train / y_test data, and subject_train / subject_test data by row. Then merged the resulting three data frames by column.

4.  Subset the data set to include only the mean and std columns, in addition to the subject and label columns.

5.  Replaced the coded labels with descriptive activities

6.  Replaced the abbreviated variable names with descriptive names

7.  Created a new data set grouped by subject and activity, with the average for each variable

8.  Output the new tidy data set to a .txt file
