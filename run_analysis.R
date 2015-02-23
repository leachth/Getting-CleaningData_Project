# Getting and Cleaning Data Course project
# The following code imports and appropriately merges and names several data files
# availabel from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# Full descriptions of the raw data set and output data set
# are availabe in the README file of the repository. 

# Note that data from the URL above should be saved on disk in your working directory.

# Read in data
    # create a list of paths and file names that are needed
      # test data
          a <- file.path( "./UCI HAR Dataset/test", 
                  c("subject_test.txt",
                  "x_test.txt",
                  "y_test.txt"))
      # train data
          b <- file.path( "./UCI HAR Dataset/train", 
                  c("subject_train.txt",
                  "x_train.txt",
                  "y_train.txt"))
      # data labels - needed for both
          cc <- file.path("./UCI HAR Dataset", 
                      c("activity_labels.txt",
                        "features.txt"))

    test = c(a,cc) # this includes the features and activity labels
    train = b 

    # import necessary files into a list
      # test, features and activity files
        all.test = list()
          for(i in 1:length(test)){
              tmp=read.table(test[i],header= FALSE)
              d.file = substr(basename(test[i]), 1, 
                        nchar(basename(test[i])) - 4)
              all.test[[d.file]] = (tmp)
              }

    # training files
        all.train = list()
          for(i in 1:length(train)){
              tmp=read.table(train[i],header= FALSE)
              d.file = substr(basename(train[i]), 1, 
                        nchar(basename(train[i])) - 4)
              all.train[[d.file]] = (tmp)
              }

    # write elements of the list into data frames so they can be merged
        list2env(all.test ,.GlobalEnv)
        list2env(all.train ,.GlobalEnv)

# There are now have separate data frames for all of the files 
# features
# activity_labels
# x_test
# y_test
# subject_test
# x_train
# y_train
# subject_train


# Combine the test and training sets into one
      xdata = rbind(x_test, x_train)
      ydata = rbind(y_test, y_train)
      subdata = rbind(subject_test, subject_train)

# Rename ydata to be the activities labels  
      ydata$activity = NULL
        for(i in 1:length(ydata$V1)){
          if(ydata[i,1] == 1) { ydata$activity[i] = as.character(activity_labels$V2[1] )
          } 
        if (ydata[i,1] == 2) { ydata$activity[i] = as.character(activity_labels$V2[2])
          } 
        if (ydata[i,1] == 3) { ydata$activity[i] = as.character(activity_labels$V2[3])
          } 
        if (ydata[i,1] == 4) { ydata$activity[i] = as.character(activity_labels$V2[4] )
         } 
        if (ydata[i,1] == 5) { ydata$activity[i] = as.character(activity_labels$V2[5])
          } 
        if (ydata[i,1]== 6) { ydata$activity[i] = as.character(activity_labels$V2[6])
          } 
      }
    # name the columns to be more intuitive
        colnames(ydata) = c("activity.no", "activity")

# Create headers for the xdata
    # turn the second row of the features data set into a vector
        x.colnames = features[, "V2"]
    # name the columns in x_test and x_train with the vector created above
        colnames(xdata) <- x.colnames

# Subset the data to include only mean and standard deviations
    # extract column index value for columns with means and standard deviations from xdata
        mean.col = grep("*mean", x.colnames)
        std.col =  grep("*std", x.colnames)
    # combine mean and std index vecrtors into a single vector
        xsubset.col.index = c(mean.col, std.col) 
    # subset the xdata and order the subset columns numerically so that 
    # mean and std for the same variables are next to each other
        xdata.subset =xdata[, sort(xsubset.col.index)]

# Merge ydata and xdata.subset
    data = cbind(ydata, xdata.subset)
# Merge the subject data sets and rename columns to be more intuitive
    colnames(subdata) = c("subject.no")
    alldata = cbind(data, subdata)

# Create a tidy data set with the average of each variable 
# by each subject and activity 
    data= alldata
    tidydata= aggregate(data[,3:81], by = data[c("subject.no", "activity")], FUN = mean, na.rm = TRUE)

# Write tidy data set to disk
write.table(tidydata,"./UCI HAR Dataset/tidydata.txt", row.name= FALSE)
          
