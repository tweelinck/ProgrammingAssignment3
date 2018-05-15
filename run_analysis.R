#This script executes an analysis of the data set consisting of the following steps:
#1 Merging the training  and test data sets.
#2 Selecting the variables that correspond to mean or standard deviation measurements (these correspond to measurements labeled by std() and mean() in the raw data set, see the CodeBook).
#3 Add subject labels and activity labels to the data set, identifying who performed what task. Moreover, the activity labels have descriptive names.
#4 Renaming the measurement variables with descriptive text names.
#5 Generate a tidy data set with the averages for the measurement variables base
#d on the subject and activity groups.
#6 The scripts returns the tidy data set

# We have labeled the steps as they occur throughout the script.

#In creating the tidy data set we make use of the dplyr package.
library(dplyr)

#The function rename is used to convert the number labels of activities by descriptive text names
rename <- function(x){
        if(x == 1){
                return('Walking')
        }
        else if(x == 2){
                return('WalkingUpstairs')
        }
        else if(x == 3){
                return('WalkingDownstairs')
        }
        else if(x==4){
                return('Sitting')
        }
        else if(x==5){
                return('Standing')
        }
        else if(x==6){
                return('Laying')
        }
        else{
                return(NA)
        }
}

#The following function performs the analysis making use of the function rename defined above.
#To use the script, source the script in Rstudio and run: `tidy_data <- run_analysis()`
run_analysis <- function(){
        #1 The following code merges the training and test data sets 
        data <- rbind(read.table('test/X_test.txt'), read.table('train/X_train.txt'))
        #2 The following code selects the variables that correspond to mean or standard deviation 
        #measurements
        features <- readLines('features.txt')
        col_selection <- grep('mean\\(\\)|std\\(\\)',features)
        data <- data[,col_selection]
        #3 The following code adds subject labels and activity labels to the data-set, where 
        #the activity labels have descriptive names
        subject_labels <- rbind(read.table('test/subject_test.txt'),read.table('train/subject_train.txt'))
        activity_labels <- rbind(read.table('test/y_test.txt'),read.table('train/y_train.txt'))
        worded_activity_labels <- character(0)
        for(i in activity_labels[,1]){
                worded_activity_labels <- c(worded_activity_labels,rename(i))
        }
        data <- cbind(subject_labels,worded_activity_labels,data)
        #4 The following code renames the variables with descriptive text names
        features <- sub("[0-9]* ", "",features[col_selection])
        features <- sub("mean\\(\\)", "Mean", features)
        features <- sub("std\\(\\)","Stdev",features)
        features <- gsub("-","",features)
        colnames(data) <- c('Subject','Activity', features)
        #5 We generate a tidy data set with the averages for the mean measurements and standard
        #deviations measurements for all pairs of subjects and activities.
        tidy_data <- summarise_all(group_by(tbl_df(data), Subject, Activity),funs(mean))
        colnames(tidy_data) <- c('Subject','Activity', paste0('AverageOF',features))
        #6 The following code specifies that the function returns the tidy data set
        tidy_data
}