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
subject.train is a variable that, you guessed it, also contains the read.csv function for the Y_train.txt!
data.train is a variable that stores the data from X_train.data
names is a function that takes data.train and stores it in a c() vector along with the subject.train, activity.train, and features.txttome!
datatest.x then takes read.table from X_test.txt and stores that information found in the file. 
activity.test
subject.test
data.testA
And names wraps up data.testA just like in the last names function, along with subject.train, activity.train, and features.txttome!

names function then takes the data.sub, which is the data substring, and then using....
a.name as a variable, I proceed to name several variables with the name a.name

These variables contain information from the file as follows:

"TimeDomain_"
"FrequencyDomain_"
"Accelerometer"
"Gyroscope"
"Magnitude"
"_Mean_"
"_StandardDeviation_"

