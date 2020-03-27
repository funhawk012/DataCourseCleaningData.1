y <- rbind(x_train,x_test)
z <- rbind(y_train,y_test)
relatableContent <- rbind(subject_train,subject_test)
conData <- cbind(relatableContent,Y,X)

tidyWork <- conData %>% select(relatableContent,code,contains("mean"), contains("std"))
tidyWork$code <- activities[TidyData$code,2]

## tidyWork essentially cleans up all of the measurements and leaves up only the selections of "code" and "subject"
names(tidyWork)[2] = "activity"
## Along with each data piece put into the system, the names function renames the data set with different names necessary for the cleanup
names(tidyWork)<-gsub("Acc","Accelerometer",names(TidyData))
names(tidyWork)<-gsub("Gyro","Gyroscope",names(TidyData))
names(tidyWork)<-gsub("BodyBody","Body",names(TidyData))
names(tidyWork)<-gsub("Mag","Magnitude",names(TidyData))
names(tidyWork)<-gsub("^t","Time",names(TidyData))
names(tidyWork)<-gsub("^f","Frequency",names(TidyData))
names(tidyWork)<-gsub("tBody","TimeBody",names(TidyData))
names(tidyWork)<-gsub("-mean()","Mean",names(TidyData),ignore.case = TRUE)
names(tidyWork)<-gsub("-std()","STD",names(TidyData),ignrore.case = TRUE)
names(tidyWork)<-gsub("-freq()","Frequency",names(TidyData),ignore.case = TRUE)
names(tidyWork)<-gsub("angle","Angle",names(TidyData))
names(tidyWork)<-gsub("gravity","Gravity",names(TidyData))

### I will create a variable called FinalDataResults,  which stores tidyWork into it for the final steps...
FinalDataResults <- tidyWork %>%
### group_by takes an existing tbl and converts it so that operations to the data will be performed "by group"
  group_by(relatableContent,activity) %>%
### summarise.all takes the function and converts the mean to it, therefore only showing the mean and standard deviation.
  summarise_all(funs(mean))
## write.table takes the results and processes the final text into code. 
write.table(FinalDataResults,"FinalData.txt",row.name=FALSE)

### The str function helps show the final code. 
str(FinalDataResults)
