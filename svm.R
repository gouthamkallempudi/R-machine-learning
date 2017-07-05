library(mlbench)
library(caret)
data("BreastCancer")

BreastCancer<-na.omit(BreastCancer)
BreastCancer<-BreastCancer[c(-1)]

index <- createDataPartition(y=BreastCancer$Class , p = 0.7 ,list=FALSE)
train<-BreastCancer[index,]
test<-BreastCancer[-index,]

fit <- train(Class~. , data=train , method = "svmRadial")
fit