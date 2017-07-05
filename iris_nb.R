
data<-read.csv("iris.csv")

set.seed(100)

index <- createDataPartition(y=data$Species , p = 0.7 ,list=FALSE)
train<-data[index,]
test<-data[-index,]

fit<-train(Species~.,data=train,method = "nb")


predicted<-predict(fit , newdata = test)
confusionMatrix(predicted , test$Species)