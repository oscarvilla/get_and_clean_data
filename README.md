# get_and_clean_data
This is an excercise of Coursera course Getting and cleanning data
## run_analysis.R Script
This script run a series of steps aiming to get a tydy dataset from a set of row data
###Disclaimer
The 'run_analysis.R' file must be pasted on te flder which contains the 'UCI HAR Dataset' folder.
###How it works
1. The script finds out which it's the current directory of work with 'getwd()' function.
2. load 'data.table' library
3. The scripts proceed to construct the overall dataset: With 'paste' function concatenate current working directory and the names of the txt files in which are the train and the test subjects, features and labels datasets are.
4. Then those datasets are readed with 'fread' function of the package 'data.table' and binded with 'cbind' and 'bind' functions to make a data.frame coherent with the framework: Subject|features|label, of 10299 rows and 563 columns, it means 10299 observations and 563 features.
5. Aiming readeness, the 'features.txt' file is readed with fread (of 'data.table' package) and passed to the dataset as dataset names.
#### Reducing the dataset to just mean ans standar deviation (sd) features
1. 
