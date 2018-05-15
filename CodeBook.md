# Codebook file for the analysis script



## Variables in tidy data set

There are 68 different variables in the tidy data set, the first two being 'Subject' and 'Activity' and 66 measurement variables. These are all given below. The explanation for the 66 measurement variables comes below.

1. Subject: this variable identifies who performed the activity. Possible values are 1-30.
2. Activity: this variable specified the activity being performed. It has six possible values: Walking, WalkingUpstairs, WalkingDownstairs, Sitting, Standing, Laying.
3. AverageOFtBodyAccMeanX
4. AverageOFtBodyAccMeanY
5. AverageOFtBodyAccMeanZ
6. AverageOFtBodyAccStdevX
7. AverageOFtBodyAccStdevY
8. AverageOFtBodyAccStdevZ
9. AverageOFtGravityAccMeanX
10. AverageOFtGravityAccMeanY
11. AverageOFtGravityAccMeanZ
12. AverageOFtGravityAccStdevX
13. AverageOFtGravityAccStdevY
14. AverageOFtGravityAccStdevZ
15. AverageOFtBodyAccJerkMeanX
16. AverageOFtBodyAccJerkMeanY
17. AverageOFtBodyAccJerkMeanZ
18. AverageOFtBodyAccJerkStdevX
19. AverageOFtBodyAccJerkStdevY
20. AverageOFtBodyAccJerkStdevZ
21. AverageOFtBodyGyroMeanX
22. AverageOFtBodyGyroMeanY
23. AverageOFtBodyGyroMeanZ
24. AverageOFtBodyGyroStdevX
25. AverageOFtBodyGyroStdevY
26. AverageOFtBodyGyroStdevZ
27. AverageOFtBodyGyroJerkMeanX
28. AverageOFtBodyGyroJerkMeanY
29. AverageOFtBodyGyroJerkMeanZ
30. AverageOFtBodyGyroJerkStdevX
31. AverageOFtBodyGyroJerkStdevY
32. AverageOFtBodyGyroJerkStdevZ
33. AverageOFtBodyAccMagMean
34. AverageOFtBodyAccMagStdev
35. AverageOFtGravityAccMagMean
36. AverageOFtGravityAccMagStdev
37. AverageOFtBodyAccJerkMagMean
38. AverageOFtBodyAccJerkMagStdev
39. AverageOFtBodyGyroMagMean
40. AverageOFtBodyGyroMagStdev
41. AverageOFtBodyGyroJerkMagMean
42. AverageOFtBodyGyroJerkMagStdev
43. AverageOFfBodyAccMeanX
44. AverageOFfBodyAccMeanY
45. AverageOFfBodyAccMeanZ
46. AverageOFfBodyAccStdevX
47. AverageOFfBodyAccStdevY
48. AverageOFfBodyAccStdevZ
49. AverageOFfBodyAccJerkMeanX
50. AverageOFfBodyAccJerkMeanY
51. AverageOFfBodyAccJerkMeanZ
52. AverageOFfBodyAccJerkStdevX
53. AverageOFfBodyAccJerkStdevY
54. AverageOFfBodyAccJerkStdevZ
55. AverageOFfBodyGyroMeanX
56. AverageOFfBodyGyroMeanY
57. AverageOFfBodyGyroMeanZ
58. AverageOFfBodyGyroStdevX
59. AverageOFfBodyGyroStdevY
60. AverageOFfBodyGyroStdevZ
61. AverageOFfBodyAccMagMean
62. AverageOFfBodyAccMagStdev
63. AverageOFfBodyBodyAccJerkMagMean
64. AverageOFfBodyBodyAccJerkMagStdev
65. AverageOFfBodyBodyGyroMagMean
66. AverageOFfBodyBodyGyroMagStdev
67. AverageOFfBodyBodyGyroJerkMagMean
68. AverageOFfBodyBodyGyroJerkMagStdev

## Units

* All measurements with 'Acc' in their name are measured in standard gravitational units 'g'.
* All measurements with 'Gyro' in their name are measured in radians/second. 

## Explanation of measurement variables

We quote here the explanation of the signal measurements in the raw data set, from the README of the raw data set.
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
> 
> These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

A variable name consists of components

* t versus f: without or with FFT applied
* BodyAcc versus Gyro: self-explanatory
* (possibly) X or Y or Z: describing the axis measured
 
the variables in the raw data set have a further component describing a function used to obtain the variable. We are interested in: 

* mean() versus std(): computed the mean or the standard deviation of signal data to obtain measurement 

## Renamed variables in the tidy set versus raw data variable names
Please note we have slightly renamed the variables, to fulfil the tidy data principle:

* We have replaced `mean()' by Mean
* We have replaced 'std()' by Stdev
* We have removed all instances of '-'

so that for example 'tBodyGyro-X-mean()' in the raw data file is renamed 'tBodyGyroXMean'.
From these measurement variables we produce averages in the tidy data set. The corresponding variable is always denoted 'AverageOF...' where '...' is the name of the variable in the raw data set.
For example, the 'tBodyGyro-X-mean()' measurements in the raw data set correspond to `AverageOFtBodyGyroXMean' in the tidy data set. 


## Unused variables from the raw data set
As we are only interested in mean and standard deviation of initial signal measurements we have excluded the following variables from the raw data set:

* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean