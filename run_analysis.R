message("loading 'reshape2' and 'plyr' packages")
library(reshape2)
library(plyr)

## Goals
## 1. each variable should be in one column
## 2. each observation of that variable should be in a diferent row
## 3. include ids to link tables together


##Extracts and Merges training and testing data
root.dir <- "UCI HAR Dataset"

message("loading features.txt")
features <- read.table(paste(root.dir, "features.txt", sep="/"), col.names=c('id', 'name'), stringsAsFactors=FALSE)
headers <- features[,2]

message("loading activity_labels.txt")
activity_labels <- read.table(paste(root.dir, "activity_labels.txt", sep="/"), col.names=c('Activity.Id', 'Activity'))


message("loading test data")
test_data <- cbind(subject=read.table(paste(root.dir, "test", "subject_test.txt", sep="/"), col.names="Subject"),
                       y=read.table(paste(root.dir, "test", "y_test.txt", sep="/"), col.names="Activity.ID"),
                       x=read.table(paste(root.dir, "test", "X_test.txt", sep="/")))

message("loading train data")
train_data <- cbind(subject=read.table(paste(root.dir, "train", "subject_train.txt", sep="/"), col.names="Subject"),
                        y=read.table(paste(root.dir, "train", "y_train.txt", sep="/"), col.names="Activity.ID"),
                        x=read.table(paste(root.dir, "train", "X_train.txt", sep="/")))

rename.features <- function(foo) {
        
        from <- c("tBody", "tGravity","fBody", "fGravity", "mean", "std", "-", "\\(\\)")
        to <- c( "Time.Body", "Time.Gravity", "FFT.Body", "FFT.Gravity", "Mean",
                 "Std", ".", "")
        
        gsub2 <- function(pattern, replacement, x, ...) {
                for(i in 1:length(pattern))
                        x <- gsub(pattern[i], replacement[i], x, ...)
                x
        }
        
        foo <- gsub2(from, to, foo)
        return(foo)
}

##Giving headers to Test and Train data
names(test_data)[-c(1,2)] <- headers
names(train_data)[-c(1,2)] <- headers

##Extracts only the measurements on the mean and standard deviation for each measurement.
bigData <- rbind(test_data, train_data)         ##Merging Test and Train data to bigData
tidy <- bigData[,c(1, 2, grep("mean\\(|std\\(", headers) + 2)]

##Uses descriptive activity names to name the activities in the data set
names(tidy) <- c("Subject", "Activity.ID", rename.features(headers[grep("mean\\(|std\\(", headers)]))

##Appropriately labels the data set with descriptive variable names and
##ordering data with respect to Subject
tidy <- merge(activity_labels, tidy, by.x="Activity.Id", by.y="Activity.ID")
tidy <- tidy[order(tidy$Subject),]

##Creates a second, independent tidy data set with the average of each variable
##for each activity and each subject and ordering data with respect to Subject
tidy.mean <-aggregate(.~Subject+Activity,tidy,FUN=mean, na.rm=TRUE)
tidy.mean <- tidy.mean[order(tidy.mean$Subject),]

##Writing the two files
write.csv(tidy.mean, file = "tidy.mean.txt",row.names = FALSE)

