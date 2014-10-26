#Getting and Cleaning Data

###Course Project

####Create R script called run_analysis.R that does the following.

<ol>
	<li>Merges the training and the test sets to create one data set.</li>
	<li>Extracts only the measurements on the mean and standard deviation for each measurement.</li>
	<li>Uses descriptive activity names to name the activities in the data set.</li>
	<li>Appropriately labels the data set with descriptive activity names.</li>
	<li>Creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ol>
	
####Steps to take in this project
<ol>
	<li>Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.</li>
	<li>Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.</li>
	<li>Run source("run_analysis.R"), then it will generate a new file tiny_data.txt in your working directory.</li>
</ol>
	
####Dependencies
<ol>
	<li>Running the run_analysis.R file will help you to install the dependencies automatically. It depends on "plyr" library.</li>
</ol>
