library(datasets)
library(glmnet)
library(caret)

#changing the factors to labels
data<-read.csv("iris.csv")
data$Species<-factor(data$Species)
set.seed(40)
index<-sample(1:nrow(data),size=0.8*nrow(data))

train<-data[index,]
test<-data[-index,]
train$Species<-factor(train$Species)
test$Species<-factor(test$Species)

x<-as.matrix(train[c(1,2,3,4)])
y<-train$Species

#applying lasso rgression
fit<-glmnet(x,y,family = "multinomial")
plot(fit,xvar="lambda")

#cross validation for lambdas
cvfit<-cv.glmnet(x,y,family="multinomial")
plot(cvfit)


cvfit$lambda.min #mean cross validation error
cvfit$lambda.1se #minimum standard error

#predictions on test data
k<-predict(cvfit, newx = as.matrix(test[c(1,2,3,4)]), s = "lambda.min",type="class")

confusionMatrix(k,test$Species)


