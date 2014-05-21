## Check if directory exists otherwise extract data from archive if zip file in working directory

if (!file.exists("UCI HAR Dataset")) {
  if (!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
    stop("was expecting HAR Dataset folder or zip file")
  } else {
    unzip("getdata_projectfiles_UCI HAR Dataset.zip")
  }
}

## Set up paths to files (Xtrain, Xtest, featues etc);
## work directory: "C:/Users/Dan/Desktop/Coursera/3. Getting and Cleaning Data/Project"

folderpath <- getwd()

# train data paths 
xtrainPath <- paste(folderpath,"/UCI HAR Dataset/train/X_train.txt",sep="")
ytrainPath <- paste(folderpath,"/UCI HAR Dataset/train/y_train.txt",sep="")
subjTrainPath <- paste(folderpath,"/UCI HAR Dataset/train/subject_train.txt",sep="")
# test data paths 
xtestPath <- paste(folderpath,"/UCI HAR Dataset/test/X_test.txt",sep="")
ytestPath <- paste(folderpath,"/UCI HAR Dataset/test/y_test.txt",sep="")
subjTestPath <- paste(folderpath,"/UCI HAR Dataset/test/subject_test.txt",sep="")
# featres and activities
featuresPath <- paste(folderpath,"/UCI HAR Dataset/features.txt",sep="")
activPath <- paste(folderpath,"/UCI HAR Dataset/activity_labels.txt",sep="")

## Now read in the data from train, test and others

# train train data
xtrainDat <- read.table(xtrainPath,header=FALSE)
ytrainDat <- read.table(ytrainPath,header=FALSE)
subjTrainDat <- read.table(subjTrainPath,header=FALSE)
# read test data 
xtestDat <- read.table(xtestPath,header=FALSE)
ytestDat <- read.table(ytestPath,header=FALSE)
subjTestDat <- read.table(subjTestPath,header=FALSE)

## 1. Merge the training and the test sets to create one data set

# Merge test data, test subject info and test activity info
trainDat <- cbind(xtrainDat, ytrainDat,subjTrainDat)
testDat <- cbind(xtestDat, ytestDat,subjTestDat)
allDat <- rbind(trainDat, testDat)
head(allDat)

## Extract column names and manipulate them to create proper coulmn name labels
headers <- read.table(featuresPath,header=FALSE)

## Remove (,) and replace with ""; replace commas and "-" with "_"
headers[,2] <- gsub("\\(","",headers[,2])
headers[,2] <- gsub("\\)","",headers[,2])
headers[,2] <- gsub("-","_",headers[,2])
headers[,2] <- gsub(",","_",headers[,2])
headers[,2] <- gsub("BodyBody","Body",headers[,2])
headers[,2] <- gsub("Acc","Accelerometer",headers[,2])
headers[,2] <- gsub("Gyro","Gyroscope",headers[,2])
headers[,2] <- gsub("Mag","Magnitude",headers[,2])

## Assign column names to data; last two need to be renamed to subject, activity
allheaders <- c(headers[,2], "activityNumber", "subjectNumber")
names(allDat) <- allheaders

## 2. Extracts only the measurements on the mean and standard deviation for each measurement

std_mean_colIndex <- rep(NA, times=length(names(allDat)))

for (i in 1:(length(names(allDat)))) {
   
  std_mean_colIndex[i] <- (grep("MEAN",toupper(names(allDat))[[i]]) 
                          || grep("STD",toupper(names(allDat))[[i]])
                          || grep("activityNumber",names(allDat)[[i]])
                          || grep("subjectNumber",names(allDat)[[i]])
              
                          )
  
  if (is.na(std_mean_colIndex[i])) std_mean_colIndex[i]=0
 
}

allDat_stdmean <- allDat[,std_mean_colIndex==1]
##dim(allDat_stdmean)
##names(allDat_stdmean)


## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.

activities <- read.table(activPath,header=FALSE)
names(activities)=c("activityNumber","activityName")
allDat_stdmean <- merge(allDat_stdmean,activities,by.X="activityNumber",by.Y="activityNumber",all.x=TRUE)
allDat_stdmean <- allDat_stdmean[,order(names(allDat_stdmean))]  #order by col name

names(allDat_stdmean)

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Compute the average within subject and activity for the 25 mean/std non unidimensional (i.e. only 3d - xyz) columns in the data
tidyDat <- aggregate( . ~ subjectNumber + activityName, data=allDat_stdmean, mean)
tidyDat <- tidyDat[order(tidyDat$activityNumber,tidyDat$subjectNumber),]
## Export the data as a comma delimited text file with column names at the top
write.table(tidyDat, file="tidy_dataset.txt",sep=",",row.names=FALSE)
