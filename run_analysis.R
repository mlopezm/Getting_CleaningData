
# Read the data
X_test=read.table("./UCIHARDataset/test/X_test.txt")
y_test=read.table("./UCIHARDataset/test/y_test.txt")
subject_test=read.table("./UCIHARDataset/test/subject_test.txt")

X_train=read.table("./UCIHARDataset/train/X_train.txt")
y_train=read.table("./UCIHARDataset/train/y_train.txt")
subject_train=read.table("./UCIHARDataset/train/subject_train.txt")

features=read.table("./UCIHARDataset/features.txt")
activity_labels=read.table("./UCIHARDataset/activity_labels.txt")

# Merges the training and the test sets to create one data set.
X_total=rbind(X_train,X_test)

y_total=rbind(y_train,y_test)
subject_total=rbind(subject_train,subject_test)

# Appropriately labels the data set with descriptive variable names. 
names(subject_total)="Subject"
names(y_total)="Activity"
names(X_total)=features$V2

# Extracts only the measurements on the mean and standard deviation for each measurement. 
index=sapply(1:dim(features)[1], function(x) grepl("mean",features$V2[x]) | grepl("std",features$V2[x]) )
X_total_extracted=X_total[,index]

#Uses descriptive activity names to name the activities in the data set
y_total$Activity=factor(y_total$Activity, levels=1:6,labels=as.character(activity_labels[,2]))

# Create a single data set with all the changes above
data=cbind(X_total_extracted,y_total,subject_total)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
a1=lapply(1, function(x) aggregate(data[,x]~Activity+Subject,data=data,mean))
lim=dim(data)[2]-2
a2=lapply(2:lim, function(x) aggregate(data[,x]~Activity+Subject,data=data,mean)[,3])
data_summarised=data.frame(a1,a2)
names(data_summarised)[3:dim(data)[2]]=names(data)[1:lim]
write.csv(data_summarised,"tidy_data.csv")