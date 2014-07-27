Code Book
==========
For the provided UCI HAR Dataset the following vars are set from run_analysis.R. See the [README](https://github.com/transformer99/Samsung-Data/blob/master/README.md) for additional details.

Test and train data were loaded separately. The subject, X, and y files were loaded for both test and train. Headers for the X values were extracted from the features.txt file and applied to both test and train datasets.

`rename.features` function is created for replacement or renaming variables. 
An example for use of `rename.features` function

Here I'm trying to replace characters in a data.frame.
```
> df <- data.frame(var1 = c("aabbcdefg", "aabbcdefg"))
> df
       var1
1 aabbcdefg
2 aabbcdefg
> df$var1 <- gsub("a", "h", df$var1)
> df$var1 <- gsub("b", "i", df$var1)
> df$var1 <- gsub("c", "j", df$var1)
> df$var1 <- gsub("d", "k", df$var1)
> df$var1 <- gsub("e", "l", df$var1)
> df$var1 <- gsub("f", "m", df$var1)
> df
       var1
1 hhiijklmg
2 hhiijklmg
> 
```
but I would like to avoid using several gsub calls, it would be much nicer to produce a function to do this at once. 

Solution for this is

You can create from and to vectors:
```
from <- c('a','b','c','d','e','f')
to <- c('h','i','j','k','l','m')
```
and then vectorialize the gsub function:
```
gsub2 <- function(pattern, replacement, x, ...) {
for(i in 1:length(pattern))
x <- gsub(pattern[i], replacement[i], x, ...)
x
}
```
Which gives:
```
> df <- data.frame(var1 = c("aabbcdefg", "aabbcdefg"))
> df$var1 <- gsub2(from, to, df$var1)
> df
       var1
1 hhiijklmg
2 hhiijklmg
```
This data is obtained from [stackoverflow](http://stackoverflow.com/questions/8703398/conditional-gsub-replacement?rq=1)

`bigData` is the variable that stores the merged data of Train and Test sets.
Then gave headers to Test and Train data.Merged train and test data and extracted only the measurements on the mean and standard deviation for each measurement. This extracted data set was named `tidy`

Uses descriptive activity names to name the activities in this extracted data set. Appropriately labeled the data set with descriptive variable names and ordering data with respect to Subject.

Activity.Id column is retained and an aggregation was performed on all columns of the `tidy`, grouping by Subject and Activity. This yielded a dataset named `tidy.mean` containing appropriately 180 observations (30 subjects * 6 activities) of the 69 variables. 

Finally, when the script is executed it will output tab separated values to a text file (named tidy.mean.txt) in the users current working directory.


Tidy Mean
=========
A data.table named tidy.mean is set with the following columns. All units are maintained from the original data set. A file named tidy.mean.txt is written from run_analysis.R.

|Column Header|	Original Name|
|--- | ---|
|Subject 	
|Activity.Id
|Activity 	
|Time.BodyAcc.Mean.X |	tBodyAcc-mean()-X|
|Time.BodyAcc.Mean.Y |	tBodyAcc-mean()-Y|
|Time.BodyAcc.Mean.Z |	tBodyAcc-mean()-Z|
|Time.BodyAcc.Std.X |	tBodyAcc-std()-X|
|Time.BodyAcc.Std.Y |	tBodyAcc-std()-Y|
|Time.BodyAcc.Std.Z |	tBodyAcc-std()-Z|
|Time.GravityAcc.Mean.X |	tGravityAcc-mean()-X|
|Time.GravityAcc.Mean.Y |	tGravityAcc-mean()-Y|
|Time.GravityAcc.Mean.Z |	tGravityAcc-mean()-Z|
|Time.GravityAcc.Std.X |	tGravityAcc-std()-X|
|Time.GravityAcc.Std.Y |	tGravityAcc-std()-Y|
|Time.GravityAcc.Std.Z |	tGravityAcc-std()-Z|
|Time.BodyAccJerk.Mean.X |	tBodyAccJerk-mean()-X|
|Time.BodyAccJerk.Mean.Y |	tBodyAccJerk-mean()-Y|
|Time.BodyAccJerk.Mean.Z |	tBodyAccJerk-mean()-Z|
|Time.BodyAccJerk.Std.X |	tBodyAccJerk-std()-X|
|Time.BodyAccJerk.Std.Y |	tBodyAccJerk-std()-Y|
|Time.BodyAccJerk.Std.Z |	tBodyAccJerk-std()-Z|
|Time.BodyGyro.Mean.X |	tBodyGyro-mean()-X|
|Time.BodyGyro.Mean.Y |	tBodyGyro-mean()-Y|
|Time.BodyGyro.Mean.Z |	tBodyGyro-mean()-Z|
|Time.BodyGyro.Std.X |	tBodyGyro-std()-X|
|Time.BodyGyro.Std.Y |	tBodyGyro-std()-Y|
|Time.BodyGyro.Std.Z |	tBodyGyro-std()-Z|
|Time.BodyGyroJerk.Mean.X |	tBodyGyroJerk-mean()-X|
|Time.BodyGyroJerk.Mean.Y |	tBodyGyroJerk-mean()-Y|
|Time.BodyGyroJerk.Mean.Z |	tBodyGyroJerk-mean()-Z|
|Time.BodyGyroJerk.Std.X |	tBodyGyroJerk-std()-X|
|Time.BodyGyroJerk.Std.Y |	tBodyGyroJerk-std()-Y|
|Time.BodyGyroJerk.Std.Z |	tBodyGyroJerk-std()-Z|
|Time.BodyAccMag.Mean |	tBodyAccMag-mean()|
|Time.BodyAccMag.Std |	tBodyAccMag-std()|
|Time.GravityAccMag.Mean |	tGravityAccMag-mean()|
|Time.GravityAccMag.Std |	tGravityAccMag-std()|
|Time.BodyAccJerkMag.Mean |	tBodyAccJerkMag-mean()|
|Time.BodyAccJerkMag.Std |	tBodyAccJerkMag-std()|
|Time.BodyGyroMag.Mean |	tBodyGyroMag-mean()|
|Time.BodyGyroMag.Std |	tBodyGyroMag-std()|
|Time.BodyGyroJerkMag.Mean |	tBodyGyroJerkMag-mean()|
|Time.BodyGyroJerkMag.Std |	tBodyGyroJerkMag-std()|
|FFT.BodyAcc.Mean.X |	fBodyAcc-mean()-X|
|FFT.BodyAcc.Mean.Y |	fBodyAcc-mean()-Y|
|FFT.BodyAcc.Mean.Z |	fBodyAcc-mean()-Z|
|FFT.BodyAcc.Std.X |	fBodyAcc-std()-X|
|FFT.BodyAcc.Std.Y |	fBodyAcc-std()-Y|
|FFT.BodyAcc.Std.Z |	fBodyAcc-std()-Z|
|FFT.BodyAccJerk.Mean.X |	fBodyAccJerk-mean()-X|
|FFT.BodyAccJerk.Mean.Y |	fBodyAccJerk-mean()-Y|
|FFT.BodyAccJerk.Mean.Z |	fBodyAccJerk-mean()-Z|
|FFT.BodyAccJerk.Std.X |	fBodyAccJerk-std()-X|
|FFT.BodyAccJerk.Std.Y |	fBodyAccJerk-std()-Y|
|FFT.BodyAccJerk.Std.Z |	fBodyAccJerk-std()-Z|
|FFT.BodyGyro.Mean.X |	fBodyGyro-mean()-X|
|FFT.BodyGyro.Mean.Y |	fBodyGyro-mean()-Y|
|FFT.BodyGyro.Mean.Z |	fBodyGyro-mean()-Z|
|FFT.BodyGyro.Std.X |	fBodyGyro-std()-X|
|FFT.BodyGyro.Std.Y |	fBodyGyro-std()-Y|
|FFT.BodyGyro.Std.Z |	fBodyGyro-std()-Z|
|FFT.BodyAccMag.Mean |	fBodyAccMag-mean()|
|FFT.BodyAccMag.Std |	fBodyAccMag-std()|
|FFT.BodyBodyAccJerkMag.Mean |	fBodyBodyAccJerkMag-mean()|
|FFT.BodyBodyAccJerkMag.Std |	fBodyBodyAccJerkMag-std()|
|FFT.BodyBodyGyroMag.Mean |	fBodyBodyGyroMag-mean()|
|FFT.BodyBodyGyroMag.Std |	fBodyBodyGyroMag-std()|
|FFT.BodyBodyGyroJerkMag.Mean |	fBodyBodyGyroJerkMag-mean()|
|FFT.BodyBodyGyroJerkMag.Std |	fBodyBodyGyroJerkMag-std()|


Tidy
=====
A data.table named tidy is set with the above mentioned columns. All units are maintained from the original data set. A file named tidy.txt is written from run_analysis.R.

Notes
======
Data for the project is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.


