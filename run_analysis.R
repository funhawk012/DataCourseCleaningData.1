#### What I attempt to do in this code is to clean up the data provided by the website, and to make all the research put in necessary
#### to merge the sets together to create a well organized data frame. But first I need to write some variables up so that I can find the
### specific files in order to make the connection with the data. features.txt, features.txttome,X.Train.data, activity.train.txt.forme,
### subject.train, and data.train are the first variables I write up, with a connection to the data provided after I downloaded the code
#### (see CodeBook.md). 

features.txt <- read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = '')
features.txttome <- as.character(features.txt[,2])
X.Train.data <- read.table('./UCI HAR Dataset/train/X_train.txt')
activity.train.txt.forme <- read.csv('./UCI HAR Dataset/train/Y_train.txt', header = FALSE, sep = '')
subject.train <- read.csv('./UCI HAR Dataset/train/subject_train.txt',header = FALSE,sep = '')
data.train <- data.frame(subject.train,activity.train.txt.forme,X.Train.data)
names(data.train) <- c(c('subject.train','activity.train'),features.txttome)

### Then I create a few more variables that help me test out the dataset and also graph the subject and the activity of the 

datatest.x <- read.table('./UCI HAR Dataset/test/X_test.txt')
activity.test <- read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
subject.test <- read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')
data.testA <-  data.frame(subject.test, activity.test, datatest.x)
names(data.testA) <- c(c('subject.train', 'activity.train'), features.txttome)


datafor.all <- rbind(data.train,data.testA)
mean_std.select <- grep('mean|std', features.txttome)
data.sub <- datafor.all[,c(1,2,mean_std.select + 2)] 
activity.read.labels <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
activity.read.labels <- as.character(activity.read.labels[.2])
data.sub$activity <- activity.read.labels[data.sub$activity]

## What I do next is create a substring function which finds an old substring and replabces it with a new one. We also create 
### A new variable called names(data.sub) which helps us move the data to organized fashion. And work at finding out a pattern to
### the dataset we will finish cleaning out using the final variables. a.name is the variable I named to gsub, or global replacement
### function which replaces all instances of the substring instead of the first.

names(data.sub) <- a.name
a.name <- names(data.sub)
a.name <- gsub("[(][)]", "", a.name)
a.name <- gsub("^t", "TimeDomain_", a.name)
a.name <- gsub("^f", "FrequencyDomain_", a.name)
a.name <- gsub("Acc", "Accelerometer", a.name)
a.name <- gsub("Gyro", "Gyroscope", a.name)
a.name <- gsub("Mag", "Magnitude", a.name)
a.name <- gsub("-mean-", "_Mean_", a.name)
a.name <- gsub("-std-", "_StandardDeviation_", a.name)
a.name <- gsub("-", "_", a.name)
names(data.sub) <- a.name

## Finally I use the data.tidy variable to combine all the information above together: data.sub$activity, which takes out of the variable
### activity.read.labels (the dataset file of activity_labels.txt), put together with the list of variables subject.train, and activity.train.
### Then I use the write.table function to organize all of the above into rows of text, using the average of each variable for each activity/subject

data.tidy <- aggregate(data.sub[,3:81], by = list(activity.train = data.sub$activity, subject.train = data.sub$subject),FUN = mean)
write.table(x = data.tidyset, file = "data_tidy.txt", row.names = FALSE)
