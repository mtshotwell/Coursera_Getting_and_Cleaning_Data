#Getting and Cleaning Data

###Course Project

###Code Book

This document describes the project, data descriptors and functions of the Run_analysis.r file

####The original data sources are located here
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

####Description of the project data sets can be found here
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Overview of Data set
<p>
	The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
	The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

	The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then 
sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter 
with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables 
from the time and frequency domain. 
</p>


####The dataset includes the following files

<ul>
<li>'README.txt'</li>
<li>'features_info.txt': Shows information about the variables used on the feature vector.</li>
<li>'features.txt': List of all features.</li>
<li>'activity_labels.txt': Links the class labels with their activity name.</li>
<li>'train/X_train.txt': Training set.</li>
<li>'train/y_train.txt': Training labels.</li>
<li>'test/X_test.txt': Test set.</li>
<li>'test/y_test.txt': Test labels.</li>
</ul>

<p> The following files are available for the train and test data. Their descriptions are equivalent. </p>

<ul>
<li>'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.</li>
<li>'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.</li>
<li>'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.</li>
<li>'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.</li>
</ul>
	
####There are 5 steps to this process
<ol>
	<li>Download the data and read it into R</li>
	<li>Merge the Test and Train data sets into one</li>
	<li>Obtain only the data related to the Mean, Standard Deviation, Subject and Activity from data</li>
	<li>Clean up field names so they are more readable.</li>
	<li>Create tiny data set with the average Mean and Standard Deviation.</li>
</ol>
	
####How Run_analysis.R implements the 5 steps
<ul>
	<li>Adds "pylr" to library</li>
	<li>Imports and extracts data</li>
	<li>Merges data sets and adds field labels</li>
	<li>Extracts mean and standard deviation fields</li>
	<li>Processes the data, including cleaning up field names and making a tiny data set</li>
</ul>

	
	
