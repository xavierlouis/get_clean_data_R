

xtrain<-read.table("train/X_train.txt")
xtest<-read.table("test/X_test.txt")

ytrain<-read.table("train/y_train.txt")
ytest<-read.table("test/y_test.txt")

subject_train<-read.table("train/subject_train.txt")
subject_test<-read.table("test/subject_test.txt")

# Step1 : Merges the training and the test sets to create one data set

#Merges X train set and X Test set
df_x<-rbind(xtest,xtrain)

#Merges Y train set and Y Test set
df_y<-rbind(ytest,ytrain)

#Merges Subject train Set and Subject Test Set
df_subject<-rbind(subject_test,subject_train)


## Step4 : Label de variables with the "features.txt" file
features_titles<-read.table("features.txt")
colnames(df_x)<-features_titles[,2]

## Step2 : Select the col with MEAN and STD
colist<-grep("mean|std", names(df_x), value = TRUE)
df_x2<-df_x[ ,colist]

## Step 3 : Naming the activities of the dataset for each row
df_y_names<-mutate(df_y, sport = ifelse(V1 == 5, "STANDING", 
                                   ifelse(V1 == 4, "SITTING",
                                          ifelse(V1 == 6, "LAYING",
                                                 ifelse(V1 == 1, "WALKING",
                                                        ifelse(V1 == 2, "WALKING_UPSTAIRS",
                                                               ifelse(V1 == 3, "WALKING_DOWNSTAIRS",
                                                                      NA)))))))

# ADDS the variable ACTIVITY to the dataset
df_all<-cbind(df_x2, df_y_names)

## STEP 5
## From the data set in step 4, creates a second, independent tidy data set with 
## the average of each variable for each activity and each subject.

# ADDS the variable SUBJECT to the dataset
df_all<-cbind(df_all, df_subject)

tidy_data<-summarize(group_by(df_all, sport, V1))

write.table(tidy_data, "tidydata.txt", sep="\t")


