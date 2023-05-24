library(dplyr)
library(knitr)

# Read in data and assign column names. Use features file for x column names
features <- read.table("./Data/UCI_HAR_Dataset/features.txt", col.names = c("feature_id","feature"))
activities <- read.table("./Data/UCI_HAR_Dataset/activity_labels.txt", col.names = c("activity_id","activity"))
xtest <- read.table("./Data/UCI_HAR_Dataset/test/X_test.txt", col.names = features$feature)
ytest <- read.table("./Data/UCI_HAR_Dataset/test/y_test.txt", col.names = "label")
subtest <- read.table("./Data/UCI_HAR_Dataset/test/subject_test.txt", col.names = "subject")
xtrain <- read.table("./Data/UCI_HAR_Dataset/train/X_train.txt", col.names = features$feature)
ytrain <- read.table("./Data/UCI_HAR_Dataset/train/y_train.txt", col.names = "label")
subtrain <- read.table("./Data/UCI_HAR_Dataset/train/subject_train.txt", col.names = "subject")


# Merge data
x <- rbind(xtest, xtrain)
y <- rbind(ytest, ytrain)
subject <- rbind(subtest, subtrain)
merged <- cbind(subject, y, x)

str(merged)
head(merged, 2)

# Extract mean and std columns
df <- merged %>% 
        select(subject, label, contains("mean"), contains("std"))

str(df)
head(df, 2)


# Use descriptive activity names

df$label <- activities[df$label, 2]
head(df,2)


# Use descriptive variables names

names(df)
View(df)

names(df)[2] = "activity"
names(df) <- gsub("^t", "Time", names(df))
names(df) <- gsub("Freq", "Frequency", names(df))
names(df) <- gsub("^f", "Frequency", names(df))
names(df) <- gsub("\\.\\.\\.", "_", names(df))
names(df) <- gsub("\\.\\.", "", names(df))
names(df) <- gsub("\\.", "", names(df))
names(df) <- gsub("Acc", "Accelerometer", names(df))
names(df) <- gsub("Mag", "Magnitude", names(df))
names(df) <- gsub("BodyBody", "Body", names(df))
names(df) <- gsub("angle", "Angle", names(df))
names(df) <- gsub("\\.mean", "Mean", names(df))
names(df) <- gsub("\\.tBody", "TimeBody", names(df))
names(df) <- gsub("\\.gravity", "Gravity", names(df))
names(df) <- gsub("\\.std", "STD", names(df))
names(df) <- gsub("Gyro", "Gyroscope", names(df))


# Create 2nd, independent tidy data set with avg of each variable for each activity/subject

avgdf <- df %>%
        group_by(subject, activity) %>%
        summarize_all(mean)

View(avgdf)

# Output data
write.table(avgdf, "tidydata.txt", row.name=FALSE)

# Output code book
knit2html("CodeBook.md")




