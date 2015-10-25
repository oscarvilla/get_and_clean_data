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
## Variables description
The tidy data variables are 
1. Subject
2. Activity
3. average of Total Body acceleration -mean()-X
4. average of Total Body acceleration -mean()-Y
5. average of Total Body acceleration -mean()-Z
6. average of Total Body acceleration -std()-X
7. average of Total Body acceleration -std()-Y
8. average of Total Body acceleration -std()-Z
9. average of Total gravity acceleration -mean()-X
10. average of Total gravity acceleration -mean()-Y
11. average of Total gravity acceleration -mean()-Z
12. average of Total gravity acceleration -std()-X
13. average of Total gravity acceleration -std()-Y
14. average of Total gravity acceleration -std()-Z
15. average of Total Body acceleration jerk -mean()-X
16. average of Total Body acceleration jerk -mean()-Y
17. average of Total Body acceleration jerk -mean()-Z
18. average of Total Body acceleration jerk -std()-X
19. average of Total Body acceleration jerk -std()-Y
20. average of Total Body acceleration jerk -std()-Z
21. average of Total Body gyro -mean()-X
22. average of Total Body gyro -mean()-Y
23. average of Total Body gyro -mean()-Z
24. average of Total Body gyro -std()-X
25. average of Total Body gyro -std()-Y
26. average of Total Body gyro -std()-Z
27. average of Total Body gyro jerk -mean()-X
28. average of Total Body gyro jerk -mean()-Y
29. average of Total Body gyro jerk -mean()-Z
30. average of Total Body gyro jerk -std()-X
31. average of Total Body gyro jerk -std()-Y
32. average of Total Body gyro jerk -std()-Z
33. average of Total Body acceleration magnitude -mean()
34. average of Total Body acceleration magnitude -std()
35. average of Total gravity acceleration magnitude -mean()
36. average of Total gravity acceleration magnitude -std()
37. average of Total Body acceleration jerk magnitude -mean()
38. average of Total Body acceleration jerk magnitude -std()
39. average of Total Body gyro magnitude -mean()
40. average of Total Body gyro magnitude -std()
41. average of Total Body gyro jerk magnitude -mean()
42. average of Total Body gyro jerk magnitude -std()
43. average of Force Body acceleration -mean()-X
44. average of Force Body acceleration -mean()-Y
45. average of Force Body acceleration -mean()-Z
46. average of Force Body acceleration -std()-X
47. average of Force Body acceleration -std()-Y
48. average of Force Body acceleration -std()-Z
49. average of Force Body acceleration -mean frecuency ()-X
50. average of Force Body acceleration -mean frecuency ()-Y
51. average of Force Body acceleration -mean frecuency ()-Z
52. average of Force Body acceleration jerk -mean()-X
53. average of Force Body acceleration jerk -mean()-Y
54. average of Force Body acceleration jerk -mean()-Z
55. average of Force Body acceleration jerk -std()-X
56. average of Force Body acceleration jerk -std()-Y
57. average of Force Body acceleration jerk -std()-Z
58. average of Force Body acceleration jerk -mean frecuency ()-X
59. average of Force Body acceleration jerk -mean frecuency ()-Y
60. average of Force Body acceleration jerk -mean frecuency ()-Z
61. average of Force Body gyro -mean()-X
62. average of Force Body gyro -mean()-Y
63. average of Force Body gyro -mean()-Z
64. average of Force Body gyro -std()-X
65. average of Force Body gyro -std()-Y
66. average of Force Body gyro -std()-Z
67. average of Force Body gyro -mean frecuency ()-X
68. average of Force Body gyro -mean frecuency ()-Y
69. average of Force Body gyro -mean frecuency ()-Z
70. average of Force Body acceleration magnitude -mean()
71. average of Force Body acceleration magnitude -std()
72. average of Force Body acceleration magnitude -mean frecuency ()
73. average of Force Body Body acceleration jerk magnitude -mean()
74. average of Force Body Body acceleration jerk magnitude -std()
75. average of Force Body Body acceleration jerk magnitude -mean frecuency ()
76. average of Force Body Body gyro magnitude -mean()
77. average of Force Body Body gyro magnitude -std()
78. average of Force Body Body gyro magnitude -mean frecuency ()
79. average of Force Body Body gyro jerk magnitude -mean()
80. average of Force Body Body gyro jerk magnitude -std()
81. average of Force Body Body gyro jerk magnitude -mean frecuency ()
82. average of angle(Total Body acceleration Mean, gravity )
83. average of angle(Total Body acceleration jerk Mean), gravity Mean)
84. average of angle(Total Body gyro Mean, gravity Mean)
85. average of angle(Total Body gyro jerk Mean, gravity Mean)
86. average of angle(X, gravity Mean)
87. average of angle(Y, gravity Mean)
88. average of angle(Z, gravity Mean)

