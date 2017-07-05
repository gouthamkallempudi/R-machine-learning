library(caret)
data<-read.csv('k_train.csv')
test_data<-read.csv('k_test.csv')
train_data<-data[-c(1,4,9,11)]
p<-test_data[c(1)]
test_data<-test_data[-c(1,3,8,10)]


train_data$Survived = factor(train_data$Survived)

for(i in c(1,3,4,5,6)){
  test_data[is.na(test_data[,i]), i] <- mean(test_data[,i], na.rm = TRUE)
}

for(i in c(2,4,5,6,7)){
  train_data[is.na(train_data[,i]), i] <- mean(train_data[,i], na.rm = TRUE)
}

#k fold
#model<-train(Survived~.,data=train_data,trControl=trainControl(method="cv",number=20),method="rpart")
#model

algorithmList <- c('lda', 'rpart', 'glm', 'svmLinear', 'svmRadial','nb','rf')

model<-caretList(Survived~.,data = train_data,methodList=algorithmList)
model
p$Survived<-predict(model , newdata = test_data)
write.csv(p,'titanic_predictions.csv')
