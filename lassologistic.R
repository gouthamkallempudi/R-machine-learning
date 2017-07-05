library(glmnet)
library(caret)
data<-read.csv("Banana.csv")
data$Label<-factor(data$Label)
index<-sample(1:nrow(data),size=0.8*nrow(data))

train<-data[index,]
test<-data[-index,]
train$Label<-factor(train$Label)
test$Label<-factor(test$Label)


y<-train$Label
x<-as.matrix(train[c(1,2)])
fit<-glmnet(x,y,family = "binomial")
plot(fit,xvar="lambda")

cvfit<-cv.glmnet(x,y,family = "binomial")

cvfit$lambda.min 
cvfit$lambda.1se
plot(cvfit)

k=predict(cvfit, newx = as.matrix(test[c(1,2)]), s = "lambda.min",type = "class")
confusionMatrix(test$Label,k)



