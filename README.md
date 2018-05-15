# README file for the analysis script

## Contents of this data set

This data set includes the following

* 'README.mb': (this file) containing overall explanation of the script, data sets used and output.
* 'CodeBook.mb': containing the explanation of all variable names appearing in the output tidy data set (including units) together with an explanation of the variable names as they appear in the raw data set we used as input.
* 'run_analysis.R': the script performing the analysis in R.
* 'tidy_data.txt': the output tidy data file written to a text file using


        write.table(tidy_data, file = 'tidy_data.txt', row.names = False)

## The raw data set

The raw data set is the data set taken from

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

and is downloadable here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files we use from the raw dataset are the following:

* 'features.txt': list of variable names in the data sets.
* 'activity_labels.txt': Links the class labels in the data sets with their activity name.
* 'train/X_train.txt': the data set for the training group
* 'train/y_train.txt': activity labels for the measurements in the training data set
* 'test/X_test.txt': the data set for the test group
* 'test/y_test.txt': activity labels for the measurements in the test data set
* 'train/subject_test.txt': subject labels identifying who performed the activity in the test data set
* 'train/subject_train.txt': subject labels identifying who performed the activity in training data set

For the context of the experiment of the raw data-set we quote, verbatim, the readme file of the raw data-set
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
Please note that the files we use from the raw data set are thus already processed data by Anguita et al. We do not use the signal data sets also provided in the raw data set.

## How does the script work

The script contained in the 'run_analysis.R' file executes an analysis of the data set consisting of the following steps:

1. Merging the training  and test data sets.
2. Selecting the variables that correspond to mean or standard deviation measurements (these correspond to measurements labeled by std() and mean() in the raw data set, see the CodeBook).
3. Add subject labels and activity labels to the data set, identifying who performed what task. Moreover, the activity labels have descriptive names.
4. Renaming the measurement variables with descriptive text names.
5. Generate a tidy data set with the averages for the measurement variables based on the subject and activity groups.

## The tidy data set
The tidy data set consists of 180 observations over 68 variables. The first two variables are 'Subject' and 'Activity', whereas the other 66 variables are computed averages of measurements (see the CodeBook for more info on the measurements). Note that the data set is tidy as each row corresponds to an observation and each column corresponds to a measurement and has a descriptive name. Thus this is a tidy data set in the so-called `wide tidy data' format. One can read the data into R using 

    read.table('tidy_data.txt', header = TRUE)

