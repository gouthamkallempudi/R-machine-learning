library(Amelia)
library(VIM)
library(DMwR)
library(caret)
library(mice)

training<- read.csv("training_data.csv")
testing<-read.csv("testing.csv")
testing<- testing[,-84]

#Imputation
training<-knnImputation(training)
testing <- knnImputation(testing)

index <- createDataPartition(y=training$PID_State, p=0.7, list=FALSE)
training_training <- training[index,]
training_testing <- training[-index,]


modelFit <- train(PID_State~., data=training_training, method="rpart")
summary(modelFit)

predictions <- predict(modelFit,newdata=training_testing) 

confusionMatrix(predictions,training_testing$PID_State)

predicted<- predict(modelFit,newdata=testing)
predicted