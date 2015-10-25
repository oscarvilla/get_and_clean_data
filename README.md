# get_and_clean_data
This is an excercise of Coursera course Getting and cleanning data
## run_analysis.R Script
This script run a series of steps aiming to get a tydy dataset from a set of row data
###Disclaimer
The 'run_analysis.R' file must be pasted on te flder which contains the 'UCI HAR Dataset' folder.
###How it works
The first part have to get a tidy dataset where training data and test data are joined coherently. These datasets some times are splitted out(usually) in 70%-30% chunks for machine learning trainig purposues.
1. The script finds out which it's the current directory of work with 'getwd()' function.
2. load 'data.table' library
3. The scripts proceed to construct the overall dataset: With 'paste' function concatenate current working directory and the names of the txt files in which are the train and the test subjects, features and labels datasets are.
4. Then those datasets are readed with 'fread' function of the package 'data.table' and binded with 'cbind' and 'bind' functions to make a data.frame coherent with the framework: Subject|features|label, of 10299 rows and 563 columns, it means 10299 observations and 563 features.
5. Aiming readeness, the 'features.txt' file is readed with fread (of 'data.table' package) and passed to the dataset as dataset names.
### Reducing the dataset to just mean ans standar deviation (sd) features
Now, the scripts preserve just the features about 'mean' and 'sd' (standard deviation).
1. Find out which of the features names contain in within him the word 'mean', and then which ones contain in within him the word 'sd'.
2. To the aiming of preserve just those features, the entire dataset are reduced o those columns preserved in step 1 just above: those ones about mean and sd.
### Now will use descriptive activity names to (re)name the activities in the data set
1. On the last row, named 'Label', the values are replaced according to the 'activity_labels.txt' file, where 1 = WALKING, 2 = WALKING_UPSTAIRS, 3 = WALKING_DOWNSTAIRS, 4 = SITTING, 5 = STANDING and 6 = LAYING.
### Appropriately labels the data set with descriptive variable names; so the features names should be written in a clearly way.
1. Where they says 't',  are replaced by 'total'
2. Where they says 'f',  are replaced by 'force'
3. Where they says 'mag',  are replaced by 'magnitude'
4. Where they says 'freq',  are replaced by 'frequency'
5. Where they says 't',  are replaced by 'total'
6. Where they says 'acc',  are replaced by 'aceleration'
7. Some other replaceents have to be done with the pourpose of eliminate double spaces, no spaces and others misspellings.
### From the data set in step just above, the script creates a second, independent tidy data set with the average (mean) of each variable for each activity and each subject
1. It's necessary to load 'dplyr' library.
2. Dataset is grouped first by 'Subject' and then by 'Activity' features.
3. After being grouped teh dataset, the script summarize by each one of those groups, and the summarizing is done by mean; it means to get the mean of each features of each of those groups.
4. Consecuently, the names of the features (or variables) must be changed. They have to be preceded with the chunk 'mean'.
5. Finally, the dataset is printed out as a data frame trying to get it in a readable way.
