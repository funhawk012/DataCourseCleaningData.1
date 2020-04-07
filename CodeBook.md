## This code book helps exhibit some of the process how the code works.......

## At the beginning there was data....(Data for the project)
[UCI HAR Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
[Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Why I did this 

The main purpose of all of the time and effort put into the project is that I wanted to compare the differnt averages found in the mean and the standard deviation of the files located in the dataset. It is truly a shame that some companies do not have well organized data sets and instead of being proud about their work, it gets locked away somewhere deep. 
I used some variables to figure out these problems that occured:

* features.txt is a variable which contains the read.csv function that allows me to read inside the first dataset for any specific kind of features. 
* features.txttome is a variable that has the as.character function that stores the feature.txt into it and coerces it's arguement to character type. 
* X.Train.data is another variable which uses read.table as its function to read the file in table form and create a data frame from it!
* activity.train.txt.forme is a fun variable that contains the read.csv function that reads the X_train.txt from the data file which I call "activity". 
* subject.train is a variable that, you guessed it, also contains the read.csv function for the Y_train.txt!
* data.train is a variable that stores the data from X_train.data
* names is a function that takes data.train and stores it in a c() vector along with the subject.train, activity.train, and features.txttome!
* datatest.x then takes read.table from X_test.txt and stores that information found in the file. 
* activity.test is a variable that takes read.csv to the file activity_test.txt in the file directory of the data.
* subject.test is a variable that takes read.csv to the file subject_test.txt in the file directory of the data.
* data.testA is a variable that takes the data.frame of the subject.test, and the activity.test to combine both into one dataset!
* And names wraps up data.testA just like in the last names function, along with subject.train, activity.train, and features.txttome!
* datafor.all binds together data.testA, and data.train
* mean_std.select is a new variable that selects out of the data, the mean and standard deviation of the data, to support the quest to complete the cleansing!
* data.sub is another variable that when plugged into an equation becomes the data substring, and stores datafor.all along with the mean and the standard deviation.
* activity.read.labels is a variable that uses function read.table to store the activity_labels.txt from the dataset.
* activity.read.labels is written again to show the as.character function to store activity.read.labels in the variable. 
* data.sub$activity is written as a variable to store activity.read.labels with data.sub$activity inside of it to store the information of the mean and standard deviation of the data!

Then we organize the data set by........

* names function then takes the data.sub, which is the data substring, and then using....
* a.name as a variable, I proceed to name several variables with the name a.name

These variables contain information from the file as follows:

* "TimeDomain_"
* "FrequencyDomain_"
* "Accelerometer"
* "Gyroscope"
* "Magnitude
* "_Mean_"
* "_StandardDeviation_"

Finally I use the data.tidy variable to combine all the information above together: data.sub$activity, which takes out of the variable activity.read.labels (the dataset file of activity_labels.txt) and aggregates the subject and the activity together to form a dataset that is much tidier than before!
* data.tidy
* write.table which finally writes up the dataset using x = data.tidyset, and I name the file data_tidy.txt, with the row names to come together as FALSE. 
* And then TADAAAAA!!!! I write up a names(data_tidyset), and out comes a beautiful dataset!
## I hope you enjoyed this project! Bye for now! 
