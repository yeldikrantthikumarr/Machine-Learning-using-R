#Churn Analysis
getwd()
setwd("C:\Users\DELL-pc\Desktop\Churn Analysis using R")
getwd()
install.packages("caret")
library(caret)
library(rpart)
library(c50)
library(rattle)
library(party)
library(partykit)
library(randomForest)
library(ROCR)
library(ggplot2)
library(reshape2)
library(corrplot)
library(e1071)
mydata <- read.csv("ChurnAnalysisTrain.csv")


mydata <- read.csv("C:\\Users\\DELL-pc\\Desktop\\Churn Analysis using R\\ChurnAnalysisTrain.CSV")
mydata
######################### Data Munging ###########################
#Reencode variables to get into numeric form
str(mydata)
mydata$Churn. <- as.integer(mydata$Churn.)
mydata$Int.l.Plan <- as.integer(mydata$Int.l.Plan)
mydata$VMail.Plan <- as.integer(mydata$VMail.Plan)

mydata$Churn.[mydata$Churn.=="1"] <- 0
mydata$Churn.[mydata$Churn.=="2"] <- 1

mydata$Int.l.Plan[mydata$Int.l.Plan=="1"] <- 0
mydata$Int.l.Plan[mydata$Int.l.Plan=="2"] <- 1

mydata$VMail.Plan[mydata$VMail.Plan=='1'] <-0
mydata$VMail.Plan[mydata$VMail.Plan=='2'] <-1

## Remove(Drop) unwanted variables
mydata$State <- NULL
mydata$Area.Code <-NULL
mydata$Phone <- NULL

## Missing value-Handling
## Remeber, this na.omit() function removes, any observation that are missing from the dataset(NULL)
na.omit(mydata)

#EDA (Exploratory Data Analysis)
summary(mydata)
sapply(mydata,sd)
#Correlation Matrix
cormatrix <- round(cor(mydata),digits = 2)
cormatrix
#Heatmap of correlation matrix using package ggplot2
qplot(x=var1,y=var2,data=melt(cor(mydata,use = "p")),fill=value, geom="tile") + scale_fill_gradient2(limits-c(-1,1))

plot.new()
plot(mydata$Churn.~mydata$Day.Mins)
title("Basic Scatterplot")
#lets plot Histogram for Day Mins
hist(mydata$Day.Mins)
title("Hist")
#Splitting data into train  and test set.
#lets divide 0.70 (70%) of data into train and rest 0.30(30%) of data into test.
#We can also prefer 80% <-> 20% as well
set.seed(4444)
ca <- sample(2,nrow(mydata),replace=T,prob = c(0.7,0.3))
trainData <- mydata[ca==1,]
testData <- mydata[ca==2,]

#Model Building
#1 Model: Logistic Regression Model
#For model selection, among AIC /BIC. Look at AIC values with lower, to choose better fit model.
#Forward step regression method

#fwdtest<- step(glm(Churn.~1,data=trainData),direction = "forward",scope = 

# Model 2 : SVM
install.packages("e1071")
library(e1071)
svmmodel<- svm(Churn.~.,data=trainData,gamma=0.1,cost=1)
svmmodel
print(svmmodel)
summary(svmmodel)
#Model 3: Random Forest
rfmodel <- randomForest(Churn.~.,data=trainData,ntree=500,mtry=50)
print(rfmodel)
importance(rfmodel)
