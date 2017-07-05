data1<-read.csv("iris.csv")
#data<-iris
new_data<-data1[,1:4]


model<-princomp(new_data, cor = TRUE ,scores = TRUE)
summary(model)
plot(model)
plot(model,type='l')
attributes(model)
loadings(model)
data1<-cbind(data1,model$scores[,1:2])


set.seed(450)

inTrain <- createDataPartition(y=data1$Species, p=0.65, list=FALSE)
training <- data1[inTrain,]
testing <- data1[-inTrain,]
dim(training)


modelFit <- train(Species~Comp.1+Comp.2, data=training, method="nb")
modelFit

modelFit$finalModel

predictions <- predict(modelFit, newdata=testing)
predictions

confusionMatrix(predictions,testing$Species)