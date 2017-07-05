library(MASS)
library(mtcars)
data<-mtcars

index<-sample(1:nrow(data),size=0.8*nrow(data))
train<-data[index,]
test<-data[-index,]

fit <- lm(mpg~.,data=train)
step <- stepAIC(fit, direction="backward")
step$anova