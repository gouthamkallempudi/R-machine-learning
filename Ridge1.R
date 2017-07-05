library(glmnet)
data<-read.csv("LungCapData.csv")

index<-sample(1:nrow(data),size=0.8*nrow(data))
train<-data[index,]
test<-data[-index,]
y<-train["LungCap"]
x<-train[c(2,3)]
x<-as.matrix(x)
y<-as.matrix(y)
fit<-glmnet(x,y,alpha=0.7)
plot(fit)

fit<-cv.glmnet(x,y,alpha=1)  #alpha =1 lasso or alpha =0 ridge
plot(fit)

fit$lambda.min #mean cross validation error
fit$lambda.1se #minimum standard error

#coef(fit, s = "lambda.min")
predict(fit, newx = as.matrix(test[c(2,3)]), s = "lambda.min")
