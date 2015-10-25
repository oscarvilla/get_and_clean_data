##find out on where directory are we working, where must to be 'UCI HAR Dataset' dir
directory <- getwd()
library(data.table)
##inside the working directory get the path to the differents '*.txt'
path_train_subjects <- paste(directory, "UCI HAR Dataset/train/subject_train.txt", 
                             sep = "/")
path_train_labels <- paste(directory, "UCI HAR Dataset/train/y_train.txt", sep = "/")
path_train_features <- paste(directory, "UCI HAR Dataset/train/X_train.txt", sep = "/")
path_test_subjects <- paste(directory, "UCI HAR Dataset/test/subject_test.txt", 
                            sep = "/")
path_test_labels <- paste(directory, "UCI HAR Dataset/test/y_test.txt", sep = "/")
path_test_features <- paste(directory, "UCI HAR Dataset/test/X_test.txt", sep = "/")
##Merging training and test sets:
##<list> function creates a list that's the argument that <rbindlis> can receives
##<rbindlist> is a function on 'data.table' package which 'Makes one data.table from a 
##list of many. To see more, type '?rbindlist'
##<cbind> function binds columns or binds by columns
##Maybe this part of the code could bee made by parts and by steps, to make it more 
##readeble, but that implicates a high memory comsumption. Then I choosed to sacrifice
##the readability of the code in exchange of memory efficiency
dataset <- cbind(rbindlist(list(fread(path_train_subjects), 
                                fread(path_test_subjects))), 
                 rbindlist(list(fread(path_train_features), 
                                fread(path_test_features))), 
                 rbindlist(list(fread(path_train_labels), 
                                fread(path_test_labels))))
##Now will import the txt file which contains the features names
##and will to store those names on 'features_names' vector
features_names <- fread("./UCI HAR Dataset/features.txt")
##Take just the second column, which have the features names and Add the 
##first feature name 'subject' and the last one 'label'
features_names <- c("subject", features_names$V2, "label")
##Now will pass those 'features_names' strings as variables names of the dataset
names(dataset) <- features_names
##Course project step 1 accomplished: Yohooo¡ 
##'Merges the training and the test sets to create one data set.'
##Go 'Extracts only the measurements on the mean and standard deviation 
##for each measurement'
##
##go to find those measurements with 'grep' function
##Which ones are means?
means_ones <- as.numeric(grep("mean", features_names, ignore.case = T))
##'ignore.case = T' because there are 'Means' and 'means', so we need 'grep' function
##does insesitive case
##Which ones are standar deviation 'std'?
std_ones <- as.numeric(grep("std", features_names))
##There are not 'Std'; just 'std', so insensitive case is not necessary
##Joint it all to hold it, but sort it too
to_hold <- sort(c(means_ones, std_ones))
##And get the new Dataset with just the columns about 'means' and 'std' features
dataset_mean_std <- cbind(dataset$label, subset(dataset, select = to_hold), 
                          dataset$label)
##Second point achieved
##Now 'Uses descriptive activity names to name the activities in the data set'
##Replace the numbers on last feature according to 'activity_labels.txt'
##Replace tne '1' by "WALKING" and so forth
dataset_mean_std$V3 <- sub(1, replacement = "WALKING", dataset_mean_std$V3)
dataset_mean_std$V3 <- sub(2, replacement = "WALKING_UPSTAIRS", dataset_mean_std$V3)
dataset_mean_std$V3 <- sub(3, replacement = "WALKING_DOWNSTAIRS", dataset_mean_std$V3)
dataset_mean_std$V3 <- sub(4, replacement = "SITTING", dataset_mean_std$V3)
dataset_mean_std$V3 <- sub(5, replacement = "STANDING", dataset_mean_std$V3)
dataset_mean_std$V3 <- sub(6, replacement = "LAYING", dataset_mean_std$V3)
##Not elegant, but for now achieved third point
##'Appropriately labels the data set with descriptive variable names'
##So, will replace abbreviations by regular expressions using as less as possible
names(dataset_mean_std) <- gsub("^t", "Total ", names(dataset_mean_std))
names(dataset_mean_std) <- gsub("^f", "Force ", names(dataset_mean_std))
names(dataset_mean_std) <- sub("mag", replacement = "magnitude ", names(dataset_mean_std), 
                               ignore.case = T)
names(dataset_mean_std) <- sub("Freq", replacement = " frecuency ", names(dataset_mean_std))
names(dataset_mean_std) <- sub("Jerk", replacement = "jerk ", names(dataset_mean_std))
names(dataset_mean_std) <- sub("gravity", replacement = " gravity ", names(dataset_mean_std), 
                               ignore.case = T)
names(dataset_mean_std) <- sub("Body+", replacement = "Body ", names(dataset_mean_std))
names(dataset_mean_std) <- sub("Acc", replacement = " acceleration ", names(dataset_mean_std))
names(dataset_mean_std) <- sub("gyro", replacement = " gyro ", names(dataset_mean_std), 
                               ignore.case = T)
names(dataset_mean_std) <- gsub("\\(t", "(Total ", names(dataset_mean_std))
names(dataset_mean_std) <- gsub("  ", " ", names(dataset_mean_std))
names(dataset_mean_std) <- sub("V1", replacement = "Subject", names(dataset_mean_std))
names(dataset_mean_std) <- sub("V3", replacement = "Activity", names(dataset_mean_std))
##Copied from http://stackoverflow.com/users/2366125/chandresh
##Fourth point achieved
##Last 'From the data set in step 4, creates a second, independent tidy data set with the 
##average of each variable for each activity and each subject.'
library(dplyr)
tidy_data <- summarise_each(group_by(dataset_mean_std, Subject, Activity), funs(mean))
##Renaming features for rigth description: there are 'average of...'
names(tidy_data)[3:88] <- paste("average of", (names(tidy_data)[3:88]), sep = " ")
print(as.data.frame(tidy_data), quote = T, row.names = T)