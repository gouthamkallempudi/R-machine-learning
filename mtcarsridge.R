library(glmnet)
library(datasets)
data<-mtcars

index<-sample(1:nrow(data),size=0.8*nrow(data))
train<-data[index,]
test<-data[-index,]
y<-as.matrix(train[c(1)])
x<-as.matrix(train[c(-1)])



fit<-glmnet(x,y,alpha=1,lambda=seq(0,1,0.1))
plot(fit,xvar="lambda")

cvfit<-cv.glmnet(x,y,alpha=1)

plot(cvfit)

cvfit$lambda.min #mean cross validation error
cvfit$lambda.1se #minimum standard error

#coef(fit, s = "lambda.min")
predict(cvfit, newx = as.matrix(test[c(-1)]), s = "lambda.min")

