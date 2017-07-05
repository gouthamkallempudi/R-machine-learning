library(mlbench)
data("BostonHousing")
head(BostonHousing)

set.seed(100)

index<- createDataPartition(y=BostonHousing$medv, p=0.7, list=FALSE)
train_data <- BostonHousing[index ,]
test_data <-BostonHousing[-index ,]

x_train<-train_data[,-14]
y_train<-train_data[,14]

x_test<-test_data[,-14]
y_test<-test_data[,14]

x<-cbind(x_train , y_train)
rpart <- train(y_train~. ,data=x, method="svmLinear")
rpart

rpart.plot(rpart$finalModel)


predicted<-predict(rpart , newdata =x_test)
sum( (predicted - mean(test_data$medv) )^2 )/sum( (test_data$medv - mean(test_data$medv) )^2 )
#confusionMatrix(predicted,y_test)


