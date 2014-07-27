Samsung-Data
============

Data Cleaning Project



Here is the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

  - You should create one R script called run_analysis.R that does the following.
  - Merges the training and the test sets to create one data set.
  - Extracts only the measurements on the mean and standard deviation for each measurement.
  - Uses descriptive activity names to name the activities in the data set
  - Appropriately labels the data set with descriptive activity names.
  - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Process
=========

These are the Goals for the process
1) each variable should be in one column
2) each observation of that variable should be in a diferent row
3) include ids to link tables together

- Setting `UCI HAR Dataset` to root directory
- Extracting and Mergeing train and test data
- Giving headers to test and train data
- Merging train and test data and Extracting only the measurements on the mean and standard deviation for each measurement
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names and ordering data with respect to Subject
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject and also ordering data with respect to Subject
- Finally, writing the file

Notes
=======
- Only vaiables containing mean() & std() are used.
- Requires the plyr & reshape2 packages.

Running
========
For running the script
```
$ Rscript run_analysis.R
```
Output is  one file: `tidy.mean.txt`

Version used for constructing:
```
> version
               _                           
platform       x86_64-pc-linux-gnu         
arch           x86_64                      
os             linux-gnu                   
system         x86_64, linux-gnu           
status                                     
major          3                           
minor          1.1                         
year           2014                        
month          07                          
day            10                          
svn rev        66115                       
language       R                           
version.string R version 3.1.1 (2014-07-10)
nickname       Sock it to Me               
```
