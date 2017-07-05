library(mlbench)
library(caret)
library(e1071)
library(klaR)
library(gbm)
set.seed(100)
data(Glass)

inTrain <- createDataPartition(y=PimaIndiansDiabetes$diabetes, p=0.7, list=FALSE)
training <- PimaIndiansDiabetes[inTrain,]
testing <- PimaIndiansDiabetes[-inTrain,]
training$diabetes <- factor(training$diabetes)


model <- gbm(formula = diabetes ~ ., 
             distribution =  "bernoulli" ,data = training,
             n.trees = 700, interaction.depth = 5,
             shrinkage = 0.1, bag.fraction = 0.5,
             train.fraction = 1.0, n.cores = NULL)
trees<-gbm.perf(model)
trees
preds <- predict(model, newdata = testing, n.trees = trees )
labels <- train$Type
1-(sum(abs(preds - labels ))/length(labels))