library(gbm)


data<-EuStockMarkets
index <- sample(1:nrow(data) , size=0.7*nrow(data))
train<-data.frame(data[index,])
test<-data.frame(data[-index,])

set.seed(1)
model <- gbm(formula = FTSE~ ., 
             distribution = "gaussian",
             data = train,
             n.trees = 700,
             interaction.depth = 5,
             shrinkage = 0.1,
             bag.fraction = 0.5,
             train.fraction = 1.0,
             n.cores = NULL)


trees<-gbm.perf(model)
trees
preds <- predict(model, newdata = test, n.trees = trees)

