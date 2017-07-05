
library(gbm)


train <- read.csv("higgs_train_10k.csv")
test <- read.csv("higgs_test_5k.csv")

set.seed(1)



for(i in 1:ncol(train))
{ 
  train[,i] <- max(train[,i]) - train[,i]
}
#finding correlation
round( cor(train) ,2 )
#appling principal component analysis
train_pca <- prcomp(train, scale = TRUE )

X<-data.frame(train_pca$x[,1:2] ,train[,1])

index<-sample(1:nrow(X),size=0.7*nrow(X))
train1<-X[index,]
test1<-X[-index,]


model <- gbm(formula = train1[,3] ~ train1[,1] + train1[,2], 
             distribution = "bernoulli",
             data = train1,
             n.trees = 70,
             interaction.depth = 5,
             shrinkage = 0.3,
             bag.fraction = 0.5,
             train.fraction = 1.0,cv.folds=10,
             n.cores = NULL)


trees<-gbm.perf(model,method = 'cv' )
trees
preds <- predict(model, newdata = test1[,1:2], n.trees = trees)
labels <- test1[,3]
1-(sum(abs(labels - preds ))/length(labels))