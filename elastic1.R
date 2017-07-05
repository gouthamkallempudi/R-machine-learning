library(glmnet)
data<-read.csv("usecnomycase.csv")
set.seed(40)
index<-sample(1:nrow(data),size=0.7*nrow(data))
train<-data[index,]
test<-data[-index,]
y<-train["X7"]
x<-train[c(1:6)]
x<-as.matrix(x)
y<-as.matrix(y)
fit<-glmnet(x,y,alpha=0.2)
plot(fit,xvar="lambda")

fit<-cv.glmnet(x,y,alpha=0.2)  #alpha =1 lasso or alpha =0 ridge
plot(fit)

fit$lambda.min #mean cross validation error
fit$lambda.1se #minimum standard error

coef(fit, s = "lambda.min")
predict(fit, newx = as.matrix(test[c(1:6)]), s = "lambda.min")
