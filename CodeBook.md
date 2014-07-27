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

|Column Header|	Original Name| Type|
|--- | ---| ---|
|Subject 	| | integer|
|Activity.Id  | | numeric|
|Activity 	| | factor|
|Time.BodyAcc.Mean.X |	tBodyAcc-mean()-X| numeric|
|Time.BodyAcc.Mean.Y |	tBodyAcc-mean()-Y| numeric|
|Time.BodyAcc.Mean.Z |	tBodyAcc-mean()-Z| numeric|
|Time.BodyAcc.Std.X |	tBodyAcc-std()-X| numeric|
|Time.BodyAcc.Std.Y |	tBodyAcc-std()-Y| numeric|
|Time.BodyAcc.Std.Z |	tBodyAcc-std()-Z| numeric|
|Time.GravityAcc.Mean.X |	tGravityAcc-mean()-X| numeric|
|Time.GravityAcc.Mean.Y |	tGravityAcc-mean()-Y| numeric|
|Time.GravityAcc.Mean.Z |	tGravityAcc-mean()-Z| numeric|
|Time.GravityAcc.Std.X |	tGravityAcc-std()-X| numeric|
|Time.GravityAcc.Std.Y |	tGravityAcc-std()-Y| numeric|
|Time.GravityAcc.Std.Z |	tGravityAcc-std()-Z| numeric|
|Time.BodyAccJerk.Mean.X |	tBodyAccJerk-mean()-X| numeric|
|Time.BodyAccJerk.Mean.Y |	tBodyAccJerk-mean()-Y| numeric|
|Time.BodyAccJerk.Mean.Z |	tBodyAccJerk-mean()-Z| numeric|
|Time.BodyAccJerk.Std.X |	tBodyAccJerk-std()-X| numeric|
|Time.BodyAccJerk.Std.Y |	tBodyAccJerk-std()-Y| numeric|
|Time.BodyAccJerk.Std.Z |	tBodyAccJerk-std()-Z| numeric|
|Time.BodyGyro.Mean.X |	tBodyGyro-mean()-X| numeric|
|Time.BodyGyro.Mean.Y |	tBodyGyro-mean()-Y| numeric|
|Time.BodyGyro.Mean.Z |	tBodyGyro-mean()-Z| numeric|
|Time.BodyGyro.Std.X |	tBodyGyro-std()-X| numeric|
|Time.BodyGyro.Std.Y |	tBodyGyro-std()-Y| numeric|
|Time.BodyGyro.Std.Z |	tBodyGyro-std()-Z| numeric|
|Time.BodyGyroJerk.Mean.X |	tBodyGyroJerk-mean()-X| numeric|
|Time.BodyGyroJerk.Mean.Y |	tBodyGyroJerk-mean()-Y| numeric|
|Time.BodyGyroJerk.Mean.Z |	tBodyGyroJerk-mean()-Z| numeric|
|Time.BodyGyroJerk.Std.X |	tBodyGyroJerk-std()-X| numeric|
|Time.BodyGyroJerk.Std.Y |	tBodyGyroJerk-std()-Y| numeric|
|Time.BodyGyroJerk.Std.Z |	tBodyGyroJerk-std()-Z| numeric|
|Time.BodyAccMag.Mean |	tBodyAccMag-mean()| numeric|
|Time.BodyAccMag.Std |	tBodyAccMag-std()| numeric|
|Time.GravityAccMag.Mean |	tGravityAccMag-mean()| numeric|
|Time.GravityAccMag.Std |	tGravityAccMag-std()| numeric|
|Time.BodyAccJerkMag.Mean |	tBodyAccJerkMag-mean()| numeric|
|Time.BodyAccJerkMag.Std |	tBodyAccJerkMag-std()| numeric|
|Time.BodyGyroMag.Mean |	tBodyGyroMag-mean()| numeric|
|Time.BodyGyroMag.Std |	tBodyGyroMag-std()| numeric|
|Time.BodyGyroJerkMag.Mean |	tBodyGyroJerkMag-mean()| numeric|
|Time.BodyGyroJerkMag.Std |	tBodyGyroJerkMag-std()| numeric|
|FFT.BodyAcc.Mean.X |	fBodyAcc-mean()-X| numeric|
|FFT.BodyAcc.Mean.Y |	fBodyAcc-mean()-Y| numeric|
|FFT.BodyAcc.Mean.Z |	fBodyAcc-mean()-Z| numeric|
|FFT.BodyAcc.Std.X |	fBodyAcc-std()-X| numeric|
|FFT.BodyAcc.Std.Y |	fBodyAcc-std()-Y| numeric|
|FFT.BodyAcc.Std.Z |	fBodyAcc-std()-Z| numeric|
|FFT.BodyAccJerk.Mean.X |	fBodyAccJerk-mean()-X| numeric|
|FFT.BodyAccJerk.Mean.Y |	fBodyAccJerk-mean()-Y| numeric|
|FFT.BodyAccJerk.Mean.Z |	fBodyAccJerk-mean()-Z| numeric|
|FFT.BodyAccJerk.Std.X |	fBodyAccJerk-std()-X| numeric|
|FFT.BodyAccJerk.Std.Y |	fBodyAccJerk-std()-Y| numeric|
|FFT.BodyAccJerk.Std.Z |	fBodyAccJerk-std()-Z| numeric|
|FFT.BodyGyro.Mean.X |	fBodyGyro-mean()-X| numeric|
|FFT.BodyGyro.Mean.Y |	fBodyGyro-mean()-Y| numeric|
|FFT.BodyGyro.Mean.Z |	fBodyGyro-mean()-Z| numeric|
|FFT.BodyGyro.Std.X |	fBodyGyro-std()-X| numeric|
|FFT.BodyGyro.Std.Y |	fBodyGyro-std()-Y| numeric|
|FFT.BodyGyro.Std.Z |	fBodyGyro-std()-Z| numeric|
|FFT.BodyAccMag.Mean |	fBodyAccMag-mean()| numeric|
|FFT.BodyAccMag.Std |	fBodyAccMag-std()| numeric|
|FFT.BodyBodyAccJerkMag.Mean |	fBodyBodyAccJerkMag-mean()| numeric|
|FFT.BodyBodyAccJerkMag.Std |	fBodyBodyAccJerkMag-std()| numeric|
|FFT.BodyBodyGyroMag.Mean |	fBodyBodyGyroMag-mean()| numeric|
|FFT.BodyBodyGyroMag.Std |	fBodyBodyGyroMag-std()| numeric|
|FFT.BodyBodyGyroJerkMag.Mean |	fBodyBodyGyroJerkMag-mean()| numeric|
|FFT.BodyBodyGyroJerkMag.Std |	fBodyBodyGyroJerkMag-std()| numeric|


Tidy
=====
A data.table named tidy is set with the above mentioned columns. All units are maintained from the original data set. A file named tidy.txt is written from run_analysis.R.

Notes
======
Data for the project is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.


