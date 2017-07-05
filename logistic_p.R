library(mlbench)
data("PimaIndiansDiabetes")
head(PimaIndiansDiabetes)
#PimaIndiansDiabetes$diabetes <- factor(PimaIndiansDiabetes$diabetes)

set.seed(100)
#splitting the data
index<- createDataPartition(y=PimaIndiansDiabetes$diabetes, p=0.7, list=FALSE)
train_data <- PimaIndiansDiabetes[index ,]
test_data <-PimaIndiansDiabetes[-index ,]

x_train<-train_data[,-9]
y_train<-train_data[,9]

x_test<-test_data[,-9]
y_test<-test_data[,9]

x<-cbind(x_train , y_train)

logistic <- train(y_train~. ,data=x, method="rf")
logistic

predicted<-predict(logistic , newdata =x_test)
confusionMatrix(predicted,y_test)


