#Script to clean sensor data from Galaxy  5 device for analysis

#Load Required Libraries
library(plyr)

##################################################################
##Step 1##
#Download and extract data (creating directory if it does not exist 
#       (Will issue warning if directory exists but I am ignoring this))
#
mainDir <- getwd()
subDir <- "Coursera_Getting_Cleaning_Project_data"

dir.create(file.path(mainDir, subDir))
setwd(file.path(mainDir, subDir))


# write the file url and file destination to an object
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file.dest <- "getdata_projectfiles_Dataset.zip"

# download from the URL
download.file(file.url, file.dest, method="curl")

#Unzip File
unzip("getdata_projectfiles_Dataset.zip")

##################################################################
##Step 2##
#Read in raw data files
Subject_Train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
Y_Train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
X_Train <- read.table("./UCI HAR Dataset/train/x_train.txt", header=FALSE)
Subject_Test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
Y_Test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
X_Test <- read.table("./UCI HAR Dataset/test/x_test.txt", header=FALSE)
Features <- read.table("./UCI HAR Dataset/features.txt", header= FALSE)
Activity_Labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)

##################################################################
##Step 3##
#Merge Data Sets into one#
Training_Data <- cbind(cbind(X_Train,Subject_Train), Y_Train)
Test_Data <- cbind(cbind(X_Test,Subject_Test), Y_Test)
Sensor_Data <- rbind(Training_Data, Test_Data)

#Add labels to Sensor_Data
##Had to convert Factor variable to character for adding additional rows
#Change Factor variable to character
i <- sapply(Features,is.factor)
Features[i] <- lapply(Features[i], as.character)
Sensor_Field_Names <- rbind(rbind(Features, c(562,"Subject")), c(563, "ActivityID"))[,2]
names(Sensor_Data) <- Sensor_Field_Names

##################################################################
##Step 4##
#Extract the measurements for the mean and standard deviation for each row
Sensor_data_mean_std <- Sensor_Data[,grepl("mean|std|Subject|ActivityID", names(Sensor_Data))]

##################################################################
##Step 5##
#Clean up field names
#Bring in names from "Activity Labels" to better describe activities
colnames(Activity_Labels) <- c("ActivityID","Activity")
Sensor_data_mean_std <- join(Sensor_data_mean_std,Activity_Labels,by = "ActivityID",match = "first")
Sensor_data_mean_std <- Sensor_data_mean_std[,-1]

#Remove parentheses
names(Sensor_data_mean_std) <- gsub('\\(|\\)',"",names(Sensor_data_mean_std), perl=TRUE)
#Run make.names to make syntactically valid names
names(Sensor_data_mean_std) <- make.names(names(Sensor_data_mean_std))

#Clean up names - clarify abbreviations
names(Sensor_data_mean_std) <- gsub('Acc','Acceleration',names(Sensor_data_mean_std))
names(Sensor_data_mean_std) <- gsub('GyroJerk',"Angular_Acceleration",names(Sensor_data_mean_std))
names(Sensor_data_mean_std) <- gsub('Gyro',"Angular_Speed",names(Sensor_data_mean_std))
names(Sensor_data_mean_std) <- gsub('Mag',"_Magnitude",names(Sensor_data_mean_std))
names(Sensor_data_mean_std) <- gsub('^t',"Time_Domain.",names(Sensor_data_mean_std))
names(Sensor_data_mean_std) <- gsub('^f',"Frequency_Domain.",names(Sensor_data_mean_std))
names(Sensor_data_mean_std) <- gsub('\\.mean',".Mean",names(Sensor_data_mean_std))
names(Sensor_data_mean_std) <- gsub('\\.std',".StandardDeviation",names(Sensor_data_mean_std))
names(Sensor_data_mean_std) <- gsub('Freq\\.',"Frequency.",names(Sensor_data_mean_std))
names(Sensor_data_mean_std) <- gsub('Freq$',"Frequency",names(Sensor_data_mean_std))
names(Sensor_data_mean_std) <- gsub('BodyBody',"Body",names(Sensor_data_mean_std))
names(Sensor_data_mean_std) <- gsub('Body',"Body_",names(Sensor_data_mean_std))
names(Sensor_data_mean_std) <- gsub('Gravity',"Gravity_",names(Sensor_data_mean_std))

##################################################################
##Step 6##

Sensor_data_Avg_by_Activity_Subject <- ddply(Sensor_data_mean_std, c("Subject","Activity"), numcolwise(mean))
write.table(Sensor_data_Avg_by_Activity_Subject, file = "Sensor_data_Avg_by_Activity_Subject.txt")