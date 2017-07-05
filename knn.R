library(ISLR)
library(caret)
data("Smarket")
head(Smarket)
set.seed(100)

index <- createDataPartition(y=Smarket$Direction , p = 0.7 ,list=FALSE)
train<-Smarket[index,]
test<-Smarket[-index,]

fit<-train(Direction~.,data=train,method = "nb")
fit

#plot(fit) #only for knn

predicted<-predict(fit , newdata = test)
confusionMatrix(predicted , test$Direction)